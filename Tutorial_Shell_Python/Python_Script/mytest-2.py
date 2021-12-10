#!/usr/bin/env python3
import time
import datetime

info = "I am Apple."
print("\033[1;33mWe asked him to introduce himself first. He said \' %s .\'\033[3;31m" %info)
print("這行是上一行結尾的顏色輸出效果")

print("\033[0m這是顯示方式0")
print("\033[36m這是前景色6")
print("\033[45m這是背景色5")
print("\033[5;35;41mxyz\033[0m")
print("\033[6mABC\033[0m")
print("\033[1mxyz")
print("\033[2mxyz")
print("\033[0m回到默認設置")
print("Default setting")


print("This is what I want.")
print("\033[33m{}\033[0m".format(time.strftime('%m/%d/%Y %a, %H:%M:%S %Z', time.localtime())))
start = datetime.datetime.now()

time.sleep(2)

end = datetime.datetime.now()
print('\033[33mTime = {}\033[0m'.format(end - start))






print("""\033[7;41m****** There is the problem for the number of event \
in the .root file. ******\033[0m""")
print("\033[7;31m****** There is the problem for the number of event "
      "in the .root file. ******\033[0m")
print("""\033[0;41m****** There is the problem for the number of event \
in the .root file. ******\033[0m""")

print("abc")
print("\n")
print("xyz")
print(1)
print("")
print(2)
print("\n")
print(3)
print("\n"*2)
print(4)
print()
print(5)
