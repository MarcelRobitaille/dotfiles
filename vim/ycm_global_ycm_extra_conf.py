"""
YouCompleteMe "ycm_extra_conf.py" for Platformio based projects.

The script calls [platformio -v run -t idedata] and process the output
to fill list with the SAME SET OF FLAGS used by platformio for the
project (compiler flags, Include dirs, compiler DEFINES, etc)

Tested on the following development environment:
    - Linux (LMDE 2)
    - PlatformIO, version 3.3.0a1
    - VIM 8.0
    - YCM 2016-12-22

This file should be copied in the "base" project dir (one ycm_extra_conf.py
for every project)

Installation:
 Copy this scrit in the project base dir (together with platformio.ini, etc)
 NOTE:
   make sure you've already run "platformio init --board xxx" in the project dir

Usage
    if everything works as expected you just call VIM to edit projet files

    To test the script behaviour, run it as a standalone script:
        phython .ycm_extra_conf
    It outputs the FLAGS that will be handle back to YCM

    Ideally You don't need to edit this file to add extra flags but,
    in case you need it, add them to the "flags" list at the beginning of
    this script


Lucabuka / 2016-12-27

Based on Anthony Ford <github.com/ajford>ajford/.ycm_extra_conf.py
    Based on the `.ycm_extra_conf.py` by @ladislas in his Bare-Arduino-Project.

Based on the `neomake-platformio.py` by github -> coddingtonbear/neomake-platformio

"""

# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import subprocess
import logging
import json
if __name__ != "__main__":
    import ycm_core

# Logger for additional logging.
# To enable debug logging, add `let g:ycm_server_log_level = 'debug'` to
# your .vimrc file.
logger = logging.getLogger('ycm-extra-conf')


# Add here any extra flag not automatically provided by "platformio run -t ide"
# usually You don't need to
flags = [
    # General flags
    # You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
    # source code needs it.
    '-DUSE_CLANG_COMPLETER'
    # ,'-MMD -DUSB_VID=null'
    # ,'-DUSB_PID=null'
]


def get_idestate(path):
    """Calls [pio -f run -t idedata] to get compiler flags from PlatformIO env
    """

    lines = subprocess.check_output([
        'pio',
        '-f',
        '-c',
        'vim',
        'run',
        '-t',
        'idedata',
        '-d',
        path,
    ], universal_newlines=True)

    splitted = lines.splitlines()

    found = 0
    env_names = []
    for line in splitted:
        env_found = line.find("Processing")
        if env_found != -1:
            env_names.append(line[env_found + 10:])
        start_brace = line.find("{")
        if start_brace != -1:
            found += 1
            if found == 1:
                end_brace = line.find("}")
                res = line[start_brace:end_brace + 1]

    if found > 1:
        if __name__ == "__main__":
            print("\nWARNING !!!\n {num} Environments found:".format(num=found))
            for a in env_names:
                print("\t" + a)
            print(" Includes and Flags taken from the FIRST one\n")
        else:
            logger.warning("!!! {num} Environments found:".format(num=found))
            for a in env_names:
                logger.warning("\t" + a)
            logger.warning(" Includes and Flags taken from the FIRST one")
            logger.warning("!!!")

    if found:
        return json.loads(res)

    return -1


def get_platformio_environment(wdir):
    """Generate the complete flags list (-I, -D, ...)

    """

    f = open('/tmp/ycm_global_ycm_extra_conf.log', 'w')

    idestate = get_idestate(wdir)
    if idestate == -1:
        return ["ERROR: get_idestate() returns -1"]

    _includes = idestate['includes']
    print(_includes, file=f)
    # _cxx_path = idestate['cxx_path']
    _cxx_flags = idestate['cxx_flags']
    # _cc_path = idestate['cc_path']
    # _cc_flags = idestate['cc_flags']
    _defines = idestate['defines']
    # _lisbsource_dirs = idestate['libsource_dirs']

    # _cxx_flags.append('-std=c++11')

    # ADD to _cxx_flags symbols found only in "_defines"
    new_cxx_flags = _cxx_flags.split()
    for define in _defines:
        found = _cxx_flags.find(define)
        if found == -1:
            # not found -> add -d<define> to cxx_flags
            new_cxx_flags.append('-D' + define)

    # insert into "includes" the working dir and ".pioenvs" (Platformio Autogen libs)
    # Platformio automatically copies over the libs you use after your first run.
    # Be warned that you will not receive autocompletion on libraries until after
    # your first `platformio run`.
    _includes.insert(0, wdir + "/src")
    _includes.insert(0, wdir + "/.pioenvs")
    _includes.insert(0, wdir + "/Inc")

    # Create "-I<include_file>" list
    inc_list = []
    for i in _includes:
        inc_list.append('-I' + i)

    f.close()
    return(flags + new_cxx_flags + inc_list + ['-std=c++11'])


def FlagsForFile(filename, **kwargs):

    #  relative_to = os.path.dirname( os.path.abspath( __file__ ) )
    relative_to = os.getcwd()
    (allflags) = get_platformio_environment(relative_to)

    logger.debug("List of FLAGS hand back to YCM:")
    for a in allflags:
        logger.debug(a)

    return {
        'flags': allflags,
        'do_cache': True
    }


# Used to TEST module output (Executd only if the module is used as a script)
if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        relative_to = sys.argv[1]
    else:
        relative_to = os.path.dirname(os.path.abspath(__file__))

    (allflags) = get_platformio_environment(relative_to)

    for a in allflags:
        print(a)
