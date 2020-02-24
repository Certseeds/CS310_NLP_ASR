#!/usr/bin/env python3
# coding=utf-8
'''
@Github: https://github.com/Certseeds
@Organization: SUSTech
@Author: nanoseeds
@Date: 2020-02-24 16:29:46
@LastEditors: nanoseeds
@LastEditTime: 2020-02-24 20:17:58
'''

string_input: str = "please input trapezoid {}"


def main():
    try:
        print(string_input.format("top's length"))
        top_length: float = float(input())
        print(string_input.format("bottom's length"))
        bottom_len: float = float(input())
        print(string_input.format("height"))
        height: float = float(input())
        print("{0:.2f}".format((top_length + bottom_len) *height/2))
    except ValueError:
        print(string_input.format(" once again"))
        main()


if __name__ == "__main__":
    main()
