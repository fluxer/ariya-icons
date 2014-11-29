#!/bin/python

import libmisc

misc = libmisc.Misc()

oxy = misc.list_files('/share/icons/oxygen/')
ary = misc.list_files('/share/icons/ariya/')

for f in oxy:
    if not f.replace('oxygen/', 'ariya/') in ary:
        print(f)