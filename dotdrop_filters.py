import re


def slufigy(s):
    return re.sub(r'[^a-zA-Z\.]', '', s)
