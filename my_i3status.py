#!/usr/bin/python

import json
import os
import os.path
import sys
import getpass
import psutil
import subprocess

def print_line(message):
	sys.stdout.write(message+"\n")
	sys.stdout.flush()

def read_line():
	try:
		line = sys.stdin.readline().strip()
		if not line:
			sys.exit(3)
		return line
	except KeyboardInterrupt:
		sys.exit()

if __name__ == '__main__':
	print_line(read_line())
	print_line(read_line())
	
	while True:
		line, prefix = read_line(), ''
		if line.startswith(','):
			line, prefix = line[1:], ','
		
		j = json.loads(line)
		
		#j.insert(0 , { 'full_text': getpass.getuser()})
		ram_usage = 'ram_usage: ' + str(psutil.virtual_memory().percent) + '%'
		j.insert(0 , { 'full_text': ram_usage })

		gpu_usage = 'gpu_usage: ' + subprocess.check_output(['nvidia-settings','-q','useddedicatedgpumemory']).split('\n')[1].split(':')[-1][:-1]	
		j.insert(0, {'full_text': str(gpu_usage) })
		print_line(prefix+json.dumps(j))
