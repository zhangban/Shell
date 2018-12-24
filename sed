sed  流编辑器 stream editor  文本编辑器  操作文本，按行进行，逐行处理  并不直接处理文本文件，而是将编辑的行，读取到内存（内存空间 称为模式空间） 在内存中编辑  输入到屏幕上

把行读取到内存-->模式匹配-->使用sed命令编辑-->输出

sed根据匹配的模式条件处理文本
sed默认不对源文件做任何处理，只对模式空间的数据做处理，处理结束
sed简单的文本编辑语言

sed语法格式
sed [选项]AddressCommand 修饰符 file1.... file2..

参数解释
选项:
-n:不显示模式空间的内容，只显示符合条件的行。
-i：直接修改源文件（小心）
-e：多个操作同时进行

Address：地址范围

1.LineNumber	#特定的行	 （$:最后一行）
2.Start，End	#起始行（1,100）
3. /^root/		#正则表达式 （找出以root开头的行）
4.mode1,mode2	#第一次被模式1匹配的行开始，到第一次被模式2匹配的行结束。
5.StartLine，+n	#从现在的行到往后n行，5,+2

Command:执行的命令

d：#删除符合条件的行；
p: 输出  打印符合条件的行；
a \内容：在指定的行后面追加新的内容；
i  \内容：在指定的行前面追加新的内容；

r file ：将指定的文件内容添加到符合条件的行
sed '2r 1.txt' passwd 
在passwd文件的第2行后面，加入1.txt文件的内容

w file：将指定的文件的内容另存为符合条件的行处
sed '/^root/w root.txt' passwd
将passwd文件中以root开头的行另存到root.txt文件中


s  /模式/字符/ ：查找并替换 s###  s@@@
sed 's/^root/zhangban/g' passwd
sed 's#^root#zhangban#g' passwd
把passwd文件中的root全部改成zhangban(g代表全部)
sed -i 's/^root/zhangban/g' passwd
-i代表修改了源文件
sed -i '7 c /zhangban i love/' passwd
表示报passwd源文件的第7行改成zhangban i love 

g ：替换所有
i：忽略字符的大小写

cop /etc/passwd  home/shiyanlou
删除符合条件的行
sed '1,3'd passwd
sed '3,$'d passwd
sed '/^root/' passwd
sed '1,+3d' passwd

打印：
sed '/^root/'p passwd
打印出来root开头的行，并把passwd文本内容再显示一遍

sed -n '/^root/'p passwd
只打印root开头的行

a:行后面追加内容(其实是第二行)
sed '/^root/a \#this is fist hang ' passwd

i:行后前面追加内容(其实跑到行前面了)
sed '/^root/i \#this is fist hang ' passwd

