#!/usr/bin/env python3

#Convert an intelHex file to a logisim memory bloc image.
#it does not care about the CRC code.
import sys

def be2le(data):
  """ big endian to little endian"""
  return data[6:]+data[4:6]+data[2:4]+data[:2]

def convert(hexFile,logisimFile):
  """ convert input IntelHex file to Logisim file. Main function"""
  for line in hexFile:
    size = int(line[1:3],16) #in bytes
    cmd = int(line[7:9])
    if cmd == 0: #data line
      addr = int(line[3:7],16)>>2 #address in 32-bit words…
      data = line[9:9+(2*size)]
      dataWords = [be2le(data[8*x:8*x+8]) for x in range(size>>2)]
      logisimFile.write(hex(addr)+': '+' '.join(dataWords)+'\n')

#very (very very) basic input argument management.
try:
  hexFileName = sys.argv[1]
except IndexError:
  print('Please give the IHex file as first argument')
  sys.exit(1)
logisimFileName = hexFileName[:-3]+'log'

#file management
with open(logisimFileName,'w') as outFile: 
  outFile.write('v3.0 hex words addressed\n')
  try:
    with open(hexFileName) as hexFile:
      convert(hexFile,outFile)
  except FileNotFoundError:
    print('Error: Cannot find input file '+hexFileName)
    sys.exit(2)