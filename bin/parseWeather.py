#!/bin/python
import requests
import time
import re

def internet():
      try:
        requests.get('http://216.58.219.206', timeout=1)
        return True
      except Exception as ex:
        return False

while not internet():
    time.sleep(1)

ansi_escape = re.compile(r'\x1b[^m]*m')

timestamp = time.strftime('%l:%M %p')

print('''${{alignc}}Weather
${{voffset -20}}${{alignr}}${{color grey}}{}
${{voffset -8}}$hr${{voffset 10}}'''.format(timestamp))

r = requests.get('http://wttr.in', headers = {'User-Agent': 'curl'})
lines = r.text.split('\n')
lines = lines[2:7]
lines = '\n'.join(lines)
lines = ansi_escape.sub('', lines)
lines = lines.split('\n')
for line in lines:
    print("{} $alignr {}".format(line[:15], line[15:].strip()))
