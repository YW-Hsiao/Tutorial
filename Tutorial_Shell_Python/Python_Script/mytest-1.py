#!/usr/bin/env python3
import sys

try:
    print("You have {} inputs which are {}.".format(len(sys.argv), sys.argv))
    path = str(sys.argv[1])
    a = int(sys.argv[2])
    print("Successful")
except:
    print("Please Check your Input")
    sys.exit(1)
    
print(path+" Hello!")
print(a * 10)

analysis_script = str(sys.argv[0])
OUTPUT_PATH = str(sys.argv[3])
rinv = float(sys.argv[4])
Lambda_d = int(sys.argv[5])
vers = str(sys.argv[6])
OUTPUT_FILE = (analysis_script[0:3] + analysis_script[9]
               + "_rinv" + str(int(rinv * 10))
               + "_Lambdad" + str(Lambda_d)
               + "_v" + vers)

print(OUTPUT_PATH + OUTPUT_FILE)

