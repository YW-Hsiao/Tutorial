#!/usr/bin/env python3
"""
Program: Just test.
         
Author: You-Wei Hsiao
Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
Mail: hsiao.phys@gapp.nthu.edu.tw
History: 2021/07/06
         First release
Version: v.1.0
"""

import sys
print(sys.argv)
a = sys.argv[1]
b = sys.argv[2]
print(a+b)
print("Transform the variables type.")

a = int(sys.argv[1])
b = int(sys.argv[2])
print(a+b)
print(a*b)
print(a/b)