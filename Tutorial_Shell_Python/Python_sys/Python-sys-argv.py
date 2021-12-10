#!/usr/bin/env python3
"""
Program: I follow the tutorial
         https://shengyu7697.github.io/python-sys-argv/
         
Author: You-Wei Hsiao
Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
Mail: hsiao.phys@gapp.nthu.edu.tw
History: 2021/07/06
         First release
Version: v.1.0
"""

import sys

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("no argument")
        sys.exit()
    print("hello")
    print(sys.argv[0])
    print(sys.argv[1])