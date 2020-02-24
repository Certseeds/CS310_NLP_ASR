#!/usr/bin/env python3
# coding=utf-8
'''
@Github: https://github.com/Certseeds
@Organization: SUSTech
@Author: nanoseeds
@Date: 2020-02-24 16:58:42 
@LastEditors  : nanoseeds
@LastEditTime : 2020-02-24 17:26:20
'''


def main():
    diction: dict[str, str] = {}
    print(type(diction))
    diction["李晓"] = "数学:95 语文:86"
    diction["王明"] = "数学:83 语文:93"
    diction["张瑶"] = "数学:79 语文:94"
    diction["周峰"] = "数学:69 语文:85"
    diction["江时"] = "数学:97 语文:88"
    print("please input 0 or 1 to get average result or all result")
    input_msg: str = input()
    if "1" == input_msg:
        for i in diction:
            print("{} {}".format(i, diction[i]))
    else:
        math: int = 0
        chinese: int = 0
        for i in diction:
            result: list[str] = diction[i].split(" ")
            math += int(result[0][3:5])
            chinese += int(result[1][3:5])
        print("average of math is :{},chinese is :{}".format(math / 5, chinese / 5))


if __name__ == '__main__':
    main()
