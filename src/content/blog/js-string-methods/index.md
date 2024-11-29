---
title: JavaScript 字符串方法
date: 2024-11-28
updateDate: 2024-11-28
tags: [编程语言, JavaScript, String]
category: [前端]
image: ./cover.jpg
---

JavaScript 字符串方法

## 1. 字符串类型转换

### 将任何类型的数据都转换为字符串，你可以用下面三种方法的任何一种

```js
var num = 10,
  str = null;
str = num.toString();
str = new String(num);
str = "" + num;
```

## 2. 字符串分割

### split() 用于分割字符串，执行后返回一个数组

- 参数 1：是根据指定内容进行截断，并且该内容会去除
- 参数 2：指定返回数组的长度，可选。若指定长度小于等于实际分割长度，则按分割结果从索引值 0 位置截取指定长度数组返回；若指定长度超出实际分割长度，则返回实际分割数组，不会额外加长。

```js
var str = "I,love,you,Do,you,love,me";
var result = null;
result = str.split(","); // ['I','love','you','do','you','love','me']
result = str.split(",", 3); // ['I','love','you']
result = str.split(",", 13); // ['I','love','you','do','you','love','me']
```

## 3. 查询子字符串

### indexOf()：返回某个字符在字符串指定范围内首次出现的位置

从字符串的开头（或指定位置）开始查找，找到第一个匹配的子字符串后返回该子字符（串）的首字符在整个字符串中的对应索引值；找不到返回 -1。

传递两个参数：indexOf(str, start)

- 参数 1： 必需，进行查找的字符
- 参数 2： 可选。开始查找的起始位置，默认为 0。合理取值是 [0, length)，且必须为整数。
- 查找是正方向进行的。
- 查找范围是 [start, length)

> 参数 2 是可以为 任意整数的，即使指定位置不存在字符。

```js
var str = "I,love,you,do,you,love,me";
var index = null;
index = str.indexOf("love"); // 2
index = str.indexOf("lave"); // -1
index = str.indexOf("love", 3); // 18
```

### lastIndexOf()：返回某个字符在字符串指定范围内最后一次出现的位置

从字符串的末尾（或指定位置）开始查找，找到第一个匹配的子字符串后返回该子字符（串）的首字符在整个字符串中的对应索引值；找不到返回 -1。对应的索引值仍是正序位置

传递两个参数：lastIndexOf(str, start)

- 参数 1： 必需，进行查找的字符
- 参数 2： 可选。开始查找的起始位置，默认为字符的长度。合理取值是 [0, length)，且必须为整数
- 查找方向是反方向进行的
- 查找范围是 [0, start)

```js
var str = "I,love,you,do,you,love,me";
var index = null;
index = str.lastIndexOf("love"); // 18
index = str.lastIndexOf("lave"); // -1
index = str.lastIndexOf("love", 16); // 2
```

> 参数 2 是可以为 任意整数的，即使指定位置不存在字符。这两个方法中负整数没有倒数位置的含义，正常取值范围为 [0, length)

## 4. 字符串替换

### replace() 有两个参数，执行后返回新的字符串

- 参数 1：需要被替换的子字符串，可以是指定字符串，还可以是**正则表达式**。对于正则表达式来说首先会根据是否全局匹配（全局/.../g）决定替换行为，如果是全部的则替换全部替换，非全局的只有替换首个匹配的字符串。
- 参数 2：替换字符串或**生成替换字符串的函数**。推荐使用函数。每次匹配到进行替换时都会执行该函数，返回值作为替换的新值。

> 参数 2 如果为函数，则函数参数的规定：
>
> - 参数 1 为每次匹配到的子字符串
> - 参数 2 为匹配到的子字符串的首字符的索引值位置
> - 参数 3 为进行匹配替换的字符串本身

```js
// 普通用法，只替换第一个
var str = "I,love,you,Do,you,love,me";
var result = null;
result = str.replace("love", "hate"); // 'I,hate,you,do,you,love,me'
```

```js
// 正则全局替换
var str = "I,love,you,Do,you,love,me";
var result = null;
result = str.replace(/love/g, "hate"); // 'I,hate,you,do,you,hate,me'
```

```js
// 复杂使用
var str = "I,love,you,Do,you,love,me";
var result = null,
  i = 0;
result = str.replace(/o/g, function () {
  return ++i;
});
// I,l1ve,y2u,D3,y4u,l5ve,me
```

## 5. 查找指定位置的字符或其字符编码值

查找位置取值范围为 [0, length)，必须为整数

### charAt() 查找指定位置字符

```js
var str = "I,love,you,Do,you,love,me";
var char = null;
char = str.charAt(8); // 'o' 字符串索引值从 0 开始
char = str.charAt(58); // ''  超出查找范围返回 空字符串，不是 null
```

### charCodeAt() 查找指定位置字符的编码值（ASCII 码），区分字母大小写，返回数据类型是 数字

```js
var str = "I,love,you,Do,you,love,me";
var char = null;
char = str.charCodeAt(8); // 111
char = str.charCodeAt(58); // NaN 超出范围返回 NaN
```

## 6. 字符串连接

### 使用 + 号连接

```js
var str1 = "Hello";
var str2 = " World";
var str = str1 + str2; // 'Hello World';
```

### concat() 连接方法，可以有传递多个参数，合并多个字符串

若参数为费字符串，则方法内部会先强制转为字符串，然后拼接。

```js
var str1 = "I";
var str2 = " Love";
var str3 = " You";
var str4 = { str: "too" };
var str = str1.concat(str2, str3, str4); // I Love You[object Object]
```

## 7. 字符串切割和提取

### slice() 提取字符串的某个部分，并以新的字符串返回被提取的部分。

传递两个参数：slice(start, end)

- 参数 1：截取的起始位置，必需
- 参数 2：截取的结束位置，可选。**若未指定此参数，则要提取的子字符串包括 start 到原字符串结尾的字符串。**
- 参数可以是负数，那么它规定的是从字符串的尾部开始算起的位置。（从尾部开始算是从 -1 开始的）
- 实际索引值较小的位置必须写在前面，否则结果为 空字符串
- 剩余字符串区段是 [start, end)

```js
var str = "0123456789";
var str1 = str.slice(2); // '23456789'
var str2 = str.slice(2, 6); // '2345'
var str3 = str.slice(-2); // '89'
var str4 = str.slice(-6, -4); // '45'
```

### substr() 方法可在字符串中抽取从开始索引值开始的指定数目的字符，作为一个新的字符串返回

传递两个参数：substr(start, length)

- 参数 1：截取的起始位置，必须。如果是负数，那么该参数声明从字符串的尾部开始算起的位置。
- 参数 2：截取的长度，可选。如果省略了该参数，那么返回从指定的开始位置到结尾的字串。
- 截取的长度区段都是正向的。如果指定的长度超过剩余长度，返回剩余的子字符串
- 剩余的字符串区段是 [start, start + length)
- ECMAscript 没有对该方法进行标准化，因此反对使用它。但是所有浏览器都支持。

```js
var str = "0123456789";
var str1 = str.substr(2, 5); // '23456'
var str2 = str.substr(-7, 5); // '34567'
var str3 = str.substr(3); // '3456789'
var str4 = str.substr(-3); // '789'
```

### substring() 方法用于提取两个指定索引值之间的子字符串。

传递两个参数：substring(start, end)

- 参数 1：截取的起始位置。必需。非负整数。
- 参数 2：截取的结束位置。非必需，非负整数。如果省略该参数，那么返回的子字符串会一直到字符串的结尾。
- 索引值较小的位置必须写在前面
- 剩余字符串区段是 [start, end)
- 只能正向截取，是 slice 的阉割版

```js
var str = "0123456789";
var str1 = str.substring(2, 6); // '2345'
var str2 = str.substring(2); // '23456789'
```

## 8. 字符串大小写转换

### 大写转小写 toLowerCase()

```js
var str = "HELLO WORLD";
str = str.toLowerCase(); // 'hello world'
```

### 小写转大写 toUpperCase()

```js
var str = "hello world";
str = str.toUpperCase(); // 'HELLO WORLD'
```

## 9. 字符串匹配

### match() 方法：在字符串内检索指定的值，或找到一个或多个正则表达式的匹配。返回一个由匹配结果组成的数组

传递一个参数：match(regexp)

- 必须，一个正则表达式
- 返回数组的内容依赖于 regexp 是否具有全局标志 g。如果没有全局标志，返回一个类数组对象。如果有全局匹配标志，则返回匹配结果组成的数组。如果没找到匹配结果返回 null 。

```js
var str = "I,love,you,Do,you,love,me";
var pattern = /love/;
var arr = str.match(pattern);
// ["love", index: 2, input: "I,love,you,Do,you,love,me"]
```

```js
var str = "I,love,you,Do,you,love,me";
var pattern = /love/g;
var arr = str.match(pattern); // ["love", "love"]
```

```js
var str = "I,love,you,Do,you,love,me";
var pattern = /hate/;
var arr = str.match(pattern); // null
```

### exec() 方法：这是属于正则对象的方法，用法和 match 类似

regexp.exec(str)，将字符串作为参数传递

> 使用全局匹配似乎没有效果......

```js
var str = "I,love,you,Do,you,love,me";
var pattern = /love/;
var arr = pattern.exec(str);
// ["love", index: 2, input: "I,love,you,Do,you,love,me"]
```

### search() 方法：查找字符串中指定的子字符串，或查找与正则表达式相匹配的子字符串

传递一个参数：search(str || regexp)

- 参数必需。返回匹配到的第一个子字符串所在的位置。如没有匹配结果返回 -1。

```js
var str = "I,love,you,Do,you,love,me";
var pattern = /love/;
var index = str.search(pattern); // 2
```

## 10. 字符串比较

### localeCompare()： 方法返回一个数字来指示一个参考字符串的在排序顺序是否在给定字符串之前、之后或与之相同

```js
// ...
```

## 11. 去除空格

### trim()，去除字符串前后的空格（中间的不能去除），返回新的字符串

- trimStart()/trimLeft()：去除字符串开始侧/左侧的空格
- trimEnd()/trimRight()：去除字符串结束侧/右侧的空格

空字符串也可以使用此方法，返回值仍为 空字符串

> 对于用户输入框内容整理很有用

```js
var str = "    a b c     ";
str = str.trim();
console.log(str); // 'a b c'
```

## 12. 样式包装方法

> [样式包装方法大全](http://www.runoob.com/jsref/jsref-obj-string.html)
