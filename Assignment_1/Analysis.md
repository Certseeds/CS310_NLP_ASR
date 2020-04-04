<!--
 * @Author: your name
 * @Date: 2020-04-04 18:18:03
 * @LastEditTime: 2020-04-04 18:53:23
 * @LastEditors: nanoseeds
 * @Description: In User Settings Edit
 * @FilePath: \Assignment_1\Analysis.md
 -->
## Q1
+ 首先,有三个参数,都是文件,1&2是输入,3是输出.
+ 所以,先判断参数数量,然后清空${3},为写入做准备.
+ 其次,查看输入输出格式,可见,输入格式为`id name useless_thing`,只需要关注每一行内,逐行分析即可.
+ 基本思路是,把name和id用${1}中的数据,在关联数组中name_id关联起来,在使用${2}的数据,从中取值填入${3}即可.
+ 所以整体就是两个循环,第一个循环建表,第二个循环写入.
+ 其中的坑点在于,name中含有`.`,不能直接用在关联数组中,需要替换成为另外一个字符,通过观察,可见name中只有[a-zA-Z._],所以应该把.替换成`-`之类的字符,双端同时转换即可.(最好替换的字符不再原来的名字中出现,保证一对一).

## Q2
### before
+ 首先,有两个参数,都是文件,1是输入,2是输出.
+ 所以,先判断参数数量,然后清空${2},为写入做准备.
+ 首先的思路还是关联数组,但是经过测试,200行数据,5*10^4个字符,时间需要30s以上,不行.
+ 然后,开始想是否可以使用并行,但是这样的话,需要120000/(200*2) = 300个以上,太多了
+ 所以只能使用内建指令.
### middle
+ 首先,通过`cat`读出文件,然后使用`tr` 将字母转化为小写.
+ 其次,钦定一个字符做特殊字符,这里取`_`,原因是原有的特殊字符`'`比较特殊,不好用,所以用这个代替.
+ 然后,开始将特殊字符清空,来保证之后的可用性,使用`sed -e s"/_/ /g" `
+ 此时,文件中没有了`_`,可以将想要屏蔽的字符转化了.
+ 在此处,我们想要的是,把前边有字母的且同时后面又空白(空格or换行符的)`'s` `'t`遮蔽成`_s` `_t`.
+ 处于未知原因,一开始使用`sed -e "s/\(?<=[a-z]\+\)\('s\)(?=\\b)//g"`(包括 正后发断言 和正先行断言),完全无效,更换了很多方式,尝试了各种加转义字符,都完全不起作用.
+ 最后,想到了捕获组,分成三个捕获组,前缀,中间,后缀,然后把中间转换掉,岂不美哉?.
+ 然后使用`sed -e  "s/\([a-z]\+\)\('s\)\(\\b\)/\1_s /g"`,匹配前有(1 or more)字母,后有空白的字符,并保留前缀,中间的`'s` -> `_s`,最后的空格/换行符变成空格(后边还有操作).完成了对`'s` `'t`的隐蔽.
+ 然后使用替换,将`[^ a-z_]`全部替换成` `
+ 此时将遮蔽好的 `'s` `'t`还原.添加换行,去掉空行.
+ 最后sort,uniq-c,sort-nr三联,获得结果.
+ 总结来看,这里最坑的
    1. 必须用一串pipe来实现,没有自己写的可能.
    2. sed 没办法用断言实现匹配,只能用捕获组实现.
    3. ` `没办法匹配换行符 `( |\\n)`也不行,只有`\\b`可以实现同时匹配` `与`\n`
    4. 原文过于巨大,调试困难(可能会忽略换行符等.)
+ 最后,sample_input_corpus.zip为原输入,但是太大,只能压缩之后上传,请解压后使用.