#!/usr/bin/python3

import sys
import socket
	
#blogarr=sys.argv
#inputfile=blogarr[1]
#print('blog name =',blogn)

import urllib.request
import json
def get_host_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()

    return ip

#str2=get_host_ip()


def inplace_change(filename, old_string, new_string):
    # Safely read the input filename using 'with'
    with open(filename) as f:
        s = f.read()
        if old_string not in s:
            print(old_string,"not found in ",filename)
            return

    # Safely write the changed content, if found in the file
    with open(filename, 'w') as f:
        print('Changing ',old_string, ' to ',new_string,' in ',filename)
        s = s.replace(old_string, new_string)
        f.write(s)
      
my_ip = json.load(urllib.request.urlopen('http://jsonip.com'))['ip']
print ('host ip=', my_ip)
a='127.0.0.1'
b=my_ip
filex='/root/jetlinks-community/docker/run-all/docker-compose.yml'
inplace_change(filex, a, b)

a=';extension=pdo_pgsql'
b='extension=pdo_pgsql'
filex='/etc/php/7.4/apache2/php.ini'
inplace_change(filex, a, b)
