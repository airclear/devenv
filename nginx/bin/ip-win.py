#!/usr/bin/env python
# -*-coding:utf-8-*-

import socket



hostname = socket.gethostname()
IPinfo = socket.gethostbyname_ex(hostname)
LocalIP = IPinfo[2][2]

def save(filename, contents):
  fh = open(filename, 'w')
  fh.write(contents)
  fh.close()
save('ip', LocalIP)
