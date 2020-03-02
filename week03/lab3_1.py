#!/usr/bin/env python3
# coding=utf-8
"""
@Github: https://github.com/Certseeds
@Organization: SUSTech
@Author: nanoseeds
@Date: 2020-03-02 23:00:46
@LastEditors  : nanoseeds
@LastEditTime : 2020-03-02 23:28:59
"""
import numpy as np


def main():
    A: np.ndarray([5, 4], np.int16) = np.random.randint(low=0, high=10, size=[5, 4])
    B: np.ndarray([5, 4], np.int16) = np.random.randint(low=0, high=10, size=[5, 4])
    print(A)
    print(B)
    A[0, :], B[0, :] = B[0, :], A[0, :].copy()
    print(A)
    print(B)
    C: np.ndarray([10, 4], np.int16) = np.concatenate((A, B), axis=0)
    print(C)
    print(C.shape)
    print(C.max())
    print(C.min())
    print(C.mean())
    print(C.sum())


if __name__ == '__main__':
    main()
