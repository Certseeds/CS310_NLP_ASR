#!/usr/bin/env python3
# coding=utf-8
"""
@Github: https://github.com/Certseeds
@Organization: SUSTech
@Author: nanoseeds
@Date: 2020-03-02 23:00:56
@LastEditors  : nanoseeds
@LastEditTime : 2020-03-03 00:09:00
"""

import matplotlib.pyplot as plt
import numpy as np


def main():
    equa: str = r'$\sin^2(x-2)e^{-x^{2}}$'
    x: np.ndarray([1000], np.float64) = np.linspace(0, 2, 1000)
    plt.plot(x, (np.sin(x - 2) ** 2) * np.exp(-1 * (x ** 2)), label=equa)
    plt.xlabel("x label")
    plt.ylabel("y label")
    plt.title(equa)
    plt.legend()
    plt.show()


if __name__ == '__main__':
    main()
