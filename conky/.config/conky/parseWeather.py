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

r = requests.get('http://wttr.in/moncton', headers = {'User-Agent': 'curl'})
text = ansi_escape.sub('', r.text)
lines = text.split('\n')
current = lines[2:7]
current = '\n'.join(current)
current = current.split('\n')
for line in current:
    print("{} $alignr {}".format(line[:15], line[15:].strip()))

today = [line[16:] for line in lines[11:16]]
for time in ['Morning', 'Noon', 'Evening', 'Night']:
    print(time)
    current = []
    for i, line in enumerate(today):
        current.append(line[:15])
        today[i] = line[31:]

    print("{} $alignr {}".format(current[0], current[1]))
