#!/usr/bin/env python3
# coding=utf-8
"""
@Github: https://github.com/Certseeds
@Organization: SUSTech
@Author: nanoseeds
@Date: 2020-03-02 17:42:01
@LastEditors  : nanoseeds
@LastEditTime : 2020-03-02 17:42:01
"""

import matplotlib.pyplot as plt
import numpy as np
import time

'''
[type_a,x,y,z] means it's a [x][y][z] matrix, which elements' type is type_a
[type_a,type_b,type_c] means it's a two demension array which 1st lines is type_1,type_b,type_c
[type_a,type_b,type_c,x,y,z] means have [x][y][z] matrix,and z = [type_a,type_b,type_c].length
each line is [type_a,type_b,type_c]
'''
type1 = [('a', int), ('b', float), ('c', str)]


def test_hint():
    a: np.ndarray([3]) = np.array([2, 3, 4], dtype=np.int)
    print(a)
    b: np.ndarray([np.int, 3]) = np.empty([3, 3], dtype=np.int)
    print(type(b))
    print(type(b[0]))
    print(type(b[0][0]))
    c: np.ndarray([3, 5], np.int) = np.arange(15).reshape(3, 5)
    print(type(c))
    d: np.ndarray([3, 5], dtype=np.float) = np.ndarray([3, 5], dtype=np.float)
    print(type(d))
    e = np.ndarray([2], dtype=[('a', int), ('b', float), ('c', str)])
    print(e)
    print(type(e))
    print(type(e[0]))
    print(type(e[0][0]))
    print(type(e[0][1]))
    print(type(e[0][2]))
    f: np.ndarray([3], dtype=type1) = np.ndarray([3], dtype=type1)
    print(f)
    print(type(f))
    print(type(f[0]))
    print(type(f[0][0]))
    print(type(f[0][1]))
    print(type(f[0][2]))
    print(f.dtype.name)


def array_creation():
    a: np.ndarray([3, 5], dtype=int) = np.arange(15).reshape(3, 5)
    print(a)
    print(a.shape)
    print(a.ndim)
    print(a.dtype.name)
    print(a.itemsize)
    print(a.size)
    b: np.ndarray([2, 2], dtype=complex) = np.array([[1, 2], [3, 4]], dtype=complex)
    print(b)
    print(type(b))
    print(np.zeros([3, 4]))
    c: np.ndarray([2, 3, 4], dtype=np.int16) = np.ones([2, 3, 4], dtype=np.int16)
    print(c)
    d: np.ndarray([2, 3], dtype=np.float64) = np.empty([2, 3])
    print(d)
    print(d.dtype.name)


def basic_operation():
    a: np.ndarray([4], dtype=np.int16) = np.array([20, 30, 40, 50], dtype=np.int16)
    b: np.ndarray([4], dtype=np.int16) = np.arange(4)
    print(b)
    c: np.ndarray([4], dtype=np.int16) = a - b
    print(c)
    print(b ** 2)
    print(10 * np.sin(a))
    print(a < 35)
    d: np.ndarray([3, 4], dtype=np.int16) = np.arange(12).reshape(3, 4)
    print(d.sum(axis=0))
    print(d.sum(axis=1))

    print(d.min(axis=0))
    print(d.min(axis=1))

    print(d.cumsum(axis=0))
    print(d.cumsum(axis=1))

    e: np.ndarray([2, 2], dtype=np.int16) = np.ones([2, 2], dtype=np.int16)
    e[1][0] = 0
    f: np.ndarray([2, 2], dtype=np.int16) = np.array([[2, 0], [3, 4]], dtype=np.int16)
    print(f * e)  # point multi, number to number.
    print(e @ f)  # matrix e*f
    print(e.dot(f))


def function_x_y(x: int, y: int) -> int:
    return 1 * x + 4 * y


def indexing_slicing_iterating():
    a: np.ndarray([10], dtype=np.int64) = np.arange(10) ** 3
    print(a)
    print(a[2:5])
    print(a[:6:2])  # 0 2 4
    a[:6:2] = 10
    print(a)
    print(a[::-1])
    for i in a:
        print(i ** (1.0 / 3.0))
    b: np.ndarray([5, 4], dtype=np.int64) = np.fromfunction(function_x_y, [5, 4], dtype=np.int64)
    # input value is
    print(b)
    print(b[2:3])
    print(b[0:5, 1])  # each rows second element.
    print(b[:, 1])
    print(b[1:3, 2])
    print(b[:6:2, :])  # 数据切片


def broadcasting_rules():
    x: np.ndarray([4], np.int32) = np.array([1, 10, 100, 1000], dtype=np.int32)
    x = x - 200
    print(x)
    y: np.ndarray([3, 2], np.int32) = np.arange(6).reshape(3, 2) + 1
    print(y)
    z: np.ndarray([1, 2], np.int32) = np.array([1, 2])
    print(y + z)


def stack_with_diff_array():
    a: np.array([2], dtype=np.float64) = np.array([4., 2.], dtype=np.float64)
    b: np.array([2], dtype=np.float64) = np.array([5., 3.], dtype=np.float64)
    print(np.vstack((a, b)))
    print(np.hstack((a, b)))
    print(a[:, np.newaxis])
    print(np.hstack(((a[:, np.newaxis]), b[:, np.newaxis])))
    print(np.concatenate((a, b), axis=0))


def matplotlib_fundamentals():
    x: np.ndarray([100], np.float64) = np.linspace(0, 2, 100)
    # 平均分割
    print(type(x))
    print(x[2])
    plt.plot(x, x, label="linear")
    plt.plot(x, x ** 2, label="quadratic")
    plt.plot(x, x ** 4, label="quart")
    plt.xlabel("x label")
    plt.xlabel("y label")
    plt.title("test plt")
    plt.legend()
    plt.show()
    time.sleep(4)
    plt.close()


def plt_test2():
    mu: int = 100
    sigma: int = 15
    x = mu + sigma * np.random.randn(10000)  # N(100,1)
    n, bins, patches = plt.hist(x, bins=12, range=[40, 160], density=True, color='blue', alpha=0.75)
    print(type(n))
    print(type(bins))
    print(type(patches))
    plt.xlabel("Smarts")
    plt.ylabel("Probability")
    plt.title("Histogram of Possibility")
    plt.text(60, 0.025, r"$\mu=100,\ \sigma=15$")
    plt.axis([40, 160, 0, 0.03])
    plt.grid(True)
    plt.show()


def main():
    # test_hint()
    # array_creation()
    # basic_operation()
    # indexing_slicing_iterating()
    # broadcasting_rules()
    # stack_with_diff_array()
    # matplotlib_fundamentals()
    plt_test2()


if __name__ == '__main__':
    main()
