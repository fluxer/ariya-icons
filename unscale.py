#!/bin/python

import os, subprocess

for root, dir, files in os.walk('scalable'):
    for f in files:
        if not f.endswith(('svg', 'svgz')):
            continue
        for size in ('16', '24', '32', '48', '64', '128'):
            ifile = root + '/' + f
            odir = size + 'x' + size + '/' + os.path.split(root)[1]
            ofile =  odir + '/' + os.path.basename(f)
            if not os.path.isdir(odir):
                os.makedirs(odir)
            if os.path.exists(ofile):
                continue
            print('Processing: ' + ifile + ' (' + size + ')')
            subprocess.check_call(('rsvg-convert', '--height=' + size,
                '--width=' + size, ifile, '--format=png', '--output', ofile))
