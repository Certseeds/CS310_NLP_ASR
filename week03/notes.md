<!--
 * @Github: https://github.com/Certseeds
 * @Organization: SUSTech
 * @Author: nanoseeds
 * @Date: 2020-03-09 11:53:18
 * @LastEditors: nanoseeds
 * @LastEditTime: 2020-03-09 12:53:06
 -->
## 模式分类 Chapter2
### 关于鱼的分类
1. 有两种鱼,$A$,$B$,两种鱼可以由外界特征分辨,我们现在由鱼的光泽度$x$来试图对判断一种鱼为A or B,前提$P(A)$+ $P(B)$= 1.光泽度是一个连续随机变量x,$P({x}|{w}_{1})$的含义是,当鱼的种类是${w}_{1}$的前提下,$x$的分布.我们想要的是$P({w}_{1}|{x})$:当某个鱼的长度是x的时候,此鱼为${w}_{1}$的概率.依照联合概率密度公式,可得
$P({x}|{w}_{1})P({w}_{1})=P({w}_{1}|{x})P({x})$.
故$P({w}_{1}|{x})=\frac{P({x}|{w}_{1})P({w}_{1})}{P({x})}$
我们试图求得左式,故需要某鱼的光泽度分布,鱼的概率密度,以及总体来说,所有鱼的光泽度分布.
1.  
