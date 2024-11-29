---
title: JavaScript 数组方法
date: 2024-11-29
updateDate: 2024-11-29
tags: [编程语言, JavaScript, Array]
category: [前端]
image: ./cover.jpg
---

JavaScript 数组方法

## 1. 栈方法（后进先出）

### push() 方法：向数组末尾追加一个或更多元素，返回的是数组新的长度

传递参数数量不定，可以传递 0 到多个，参数之间使用 , 隔开

- 改变了原有数组，不会返回新数组

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var length = fruits.push("Kiwi");
console.log(length); // 5
console.log(fruits); // ['Banana', 'Orange', 'Apple', 'Mango', 'Kiwi']
```

### pop() 方法：向数组中删除最后一个元素并且返回该元素

不需要传递参数

- 改变了原有数组，不会返回新数组
- 如果数组为空就返回 undefined

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var item = fruits.pop();
console.log(item); // 'Mango'
console.log(fruits); //  ['Banana', 'Orange', 'Apple']
```

```js
var fruits = [];
var item = fruits.pop();
console.log(item); // undefined
console.log(fruits); //  []
```

## 2. 队列方法

### shift() 方法：把数组的第一个元素删除，并作为返回值返回

不需要传递参数

- 改变了原有数组，不会返回新数组
- 如果数组为空就返回 undefined

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var item = fruits.shift();
console.log(item); // 'Banana'
console.log(fruits); // ['Orange', 'Apple', 'Mango']
```

```js
var fruits = [];
var item = fruits.shift();
console.log(item); // undefined
console.log(fruits); // []
```

### unshift()方法：向数组的开头添加一个或更多元素，返回的是数组新的长度

传递参数数量不定，可以传递 0 到多个，参数之间使用 , 隔开

- 改变了原有数组，不会返回新数组

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var length = fruits.unshift("Lemon", "Pineapple");
console.log(length); // 6
console.log(fruits); // ['Lemon', 'Pineapple', 'Banana', 'Orange', 'Apple', 'Mango']
```

## 3. 转换方法

### join() 方法：用于把数组中的所有元素转换一个字符串并进行连接

- 在转换时，内部的空值和未定义值会去除，但是 分隔符 , 会被保留
- 对于非字符串数据会被强制转为字符串
- 返回一个新的字符串，不会改变原数组

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
var energy = fruits.join();
console.log(fruits); // ['Banana', 'Orange', 'Apple', 'Mango']
console.log(energy); // 'Banana,Orange,Apple,Mango'
```

特殊元素转化

```js
var fruits = [
  "Banana",
  "",
  123,
  NaN,
  undefined,
  null,
  () => {},
  { name: "szx", age: 28 },
  [],
];
var energy = fruits.join();
console.log(energy); // 'Banana,,123,NaN,,,() => { },[object Object],'
```

## 4. 重排序方法

### sort() 方法：用于对数组的元素进行排序

sort(sortFn)：可传递一个参数

- 默认排序顺序为按字母升序。为了实现排序，sort() 方法会对每个数组项调用 toString() 转型方法，然后比较得到字符串，以确定如何排序。（实质按照首字母 ASCII 码顺序进行排列，首字母相同比较第二个，依次类推）
- 参数可选，非必需。
- 若传递参数，参数必须是一个函数，且函数须有两个参数。sort() 方法会自动把数组中元素两两传入函数中，根据函数返回值进行排序。如果想让第一个参数应该位于第二个之前则返回一个负数；如果想让第一个参数位于第二个之后则返回一个正数；如果两个参数想保持原有顺序，返回 0。（可以自定义排序方法，本质上最终目的还是两个具体的值之间进行比大小）
- 改变了原有数组，不会返回新数组

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits = fruits.sort();
console.log(fruits); // ['Apple', 'Banana', 'Mango', 'Orange']
```

```js
var fruits = [
  { name: "Banana", price: 13 },
  { name: "Orange", price: 8 },
  { name: "Apple", price: 20 },
  { name: "Mango", price: 4 },
];
fruits = fruits.sort((val1, val2) => {
  if (val1.price < val2.price) {
    return -1;
  } else if (val1.price > val2.price) {
    return 1;
  } else {
    return 0;
  }
});
console.log(fruits);
// [{ name: 'Mango', price: 4 }, { name: 'Orange', price: 8 }, { name: 'Banana', price: 13 }, { name: 'Apple', price: 20 }]
```

### reverse()方法：用于颠倒数组中元素的顺序

无参数

- 只是将数组中的现有排列顺序进行反向，和元素的值无关
- 改变了原有数组，不会返回新数组

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.reverse();
console.log(fruits); // ['Mango', 'Apple', 'Orange', 'Banana']
```

## 5. 操作方法

### concat() 方法：连接两个或多个数组

可传递多个参数

- 参数数据类型不作限制。若类型不是数组，则连接后作为一个数组的元素。
- 不会改变现有的数组，而返回连接后的新数组。

```js
var hege = ["Cecilie", "Lone"];
var stale = ["Emil", "Tobias", "Linus"];
var kai = "Robin";
var children = hege.concat(stale, kai);
console.log(hege); // ['Cecilie', 'Lone']
console.log(children); // ['Cecilie', 'Lone', 'Emil', 'Tobias', 'Linus', 'Robin']
```

### splice() 方法：插入、删除或替换数组的元素

功能强大，增删改都可以

可传递 3 个参数，splice(start, length, newItem)

- 参数 1：必需。规定从何处添加/删除元素。该参数是开始插入和（或）删除的数组元素的下标，必须是数字。添加从指定的开始位置进行添加，删除时会删除开始位置的元素
- 参数 2：可选。规定应该删除多少元素。必须是非负整数，可以是 0。如果未规定此参数，则删除从 index 开始到原数组结尾的所有元素
- 参数 3：可选。要添加到数组的新元素，新元素使用分隔符 , 隔开，数量不限
- 改变了原有数组，不会返回新数组

#### 插入元素

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 0, "Lemon", "Kiwi");
console.log(fruits); // ['Banana', 'Orange', 'Lemon', 'Kiwi', 'Apple', 'Mango']
// 从下标为 2 的元素开始，删除 0 个元素，插入指定新元素
```

#### 删除元素

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 1);
console.log(fruits); // ['Banana', 'Orange', 'Mango']
// 从下标为 2 的元素开始，删除 1 个元素
```

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2);
console.log(fruits); // ['Banana', 'Orange']
// 从下标为 2 的元素开始，后续全部删除
```

#### 替换元素

```js
var fruits = ["Banana", "Orange", "Apple", "Mango"];
fruits.splice(2, 1, "Lemon", "Kiwi");
console.log(fruits); // ['Banana', 'Orange', 'Lemon', 'Kiwi', 'Mango']
// 从下标为 2 的元素开始，先删除 1 个元素，再插入指定新元素
```

### slice() 方法：从已有的数组中截取选定的元素，组成新的数组返回

传递两个参数，slice(start, end)

- 参数 1：必需。规定从何处开始选取。如果是负数，那么它规定从数组尾部开始算起的位置。也就是说，-1 指最后一个元素，-2 指倒数第二个元素，以此类推。
- 参数 2：可选。规定从何处结束选取。该参数是数组片断结束处的数组下标。如果没有指定该参数，那么截取的数组包含从 start 位置 到数组结束的所有元素。如果这个参数是负数，那么它规定的是从数组尾部开始算起的元素
- 截取的范围是 [start, end)
- 截取方向为正向截取。指定位置的实际索引值较小的必须放在前面，否则截取的为 空数组
- 不会改变原数组，会返回新的数组

```js
var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
var arr1 = fruits.slice(1, 3); // ['Orange', 'Lemon']
var arr2 = fruits.slice(2); // ['Lemon', 'Apple', 'Mango']
var arr3 = fruits.slice(-5, -2); // ['Banana', 'Orange', 'Lemon']
var arr3 = fruits.slice(0); // ['Banana', 'Orange', 'Lemon', 'Apple', 'Mango'];
console.log(fruits); // ['Banana', 'Orange', 'Lemon', 'Apple', 'Mango']
```

## 6. 遍历方法

### every() 方法：检测数组所有元素是否都符合指定条件（通过函数提供）

传递两个参数：every(function(currentValue, index, arr){ }, thisValue)

- 参数 1：必需，且必须是函数。**函数还必须有返回值，返回当前元素在函数中根据自定义条件判断的结果（返回值必须是布尔值或者运算结果为布尔值或可以转换为布尔值的表达式）**
  > 此函数的要求：
  >
  > - 参数 1：必需，进行条件判断的当前元素，数组中的每个元素都会被依次传入
  > - 参数 2：可选，当前元素的索引值
  > - 参数 3：可选，当期元素属于的数组对象
  > - 注意不要写成 箭头函数，否则无法指定当前函数的 this 指向；this 默认指向 window
- 参数 2：可选。对象作为回调函数的 this 的值。如果省略了 thisValue，this 默认指向 window
- 对数组中的每个元素都执行一次指定的函数（callback），如果发现一个元素根据条件判断结果为 false，则 every 将返回 false，并且停止对后续元素的判断。如果回调函数对每个元素条件判断后都返回 true，every() 将返回 true。**空数组不会执行此方法，并且它只对数组中的非空位置元素执行指定的函数，没有赋值或者已经删除的元素将被忽略**
- 不会改变现有的数组

```js
// 判断所有元素是否都小于 30
var ages = [32, 33, 16, 40];
var bool = ages.every(function (item) {
  return item < 30;
});
console.log(bool); // false
```

### some() 方法：检测数组中的元素是否满足指定条件（通过函数提供）

传递两个参数：some(function(currentValue, index, arr){ }, thisValue)

- 参数 1：必需，且必须是函数。**函数还必须有返回值，返回当前元素在函数中根据自定义条件判断的结果（返回值必须是布尔值或者运算结果为布尔值或可以转换为布尔值的表达式）**
  > 此函数的要求：
  >
  > - 参数 1：必需，进行条件判断的当前元素，数组中的每个元素都会被依次传入
  > - 参数 2：可选，当前元素的索引值
  > - 参数 3：可选，当期元素属于的数组对象
  > - 注意不要写成 箭头函数，否则无法指定当前函数的 this 指向；this 默认指向 window
- 参数 2：可选。对象作为回调函数的 this 的值。如果省略了 thisValue，this 默认指向 window
- 对数组中的每个元素都执行一次指定的函数（callback），如果发现一个元素根据条件判断结果为 true，则 some 将返回 true，并且停止对后续元素的判断。如果回调函数对每个元素条件判断后都返回 false，some() 将返回 false。**空数组不会执行此方法，并且它只对数组中的非空位置的元素执行指定的函数，没有赋值或者已经删除的元素将被忽略**
- 不会改变现有的数组

```js
// 判断是否有元素小于 30
var ages = [32, 33, 16, 40];
var bool = ages.some(function (item) {
  return item < 30;
});
console.log(bool); // true
```

> every() 和 some() 类似，every 是所有元素都满足条件才返回 true，some 是只要有一个满足条件就返回 true
> IE 9 及其以上支持

### filter() 方法：在数组中筛选满足条件的元素，组成新数组返回

传递两个参数：filter(function(currentValue, index, arr){ }, thisValue)

- 参数 1：必需，且必须是函数。**函数还必须有返回值，返回当前元素在函数中根据自定义条件判断的结果（返回值必须是布尔值或者运算结果为布尔值或可以转换为布尔值的表达式）**
  > 此函数的要求：
  >
  > - 参数 1：必需，进行条件判断的当前元素，数组中的每个元素都会被依次传入
  > - 参数 2：可选，当前元素的索引值
  > - 参数 3：可选，当期元素属于的数组对象
  > - 注意不要写成 箭头函数，否则无法指定当前函数的 this 指向；this 默认指向 window
- 参数 2：可选。对象作为回调函数的 this 的值。如果省略了 thisValue，this 默认指向 window
- 对数组中的每个元素都执行一次指定的函数（callback），在函数内部对每一个元素进行自定义条件判断。filter 方法会创建一个新的数组，该数组元素是所有在回调函数根据自定义判断结果返回值为 true 的原数组元素。**空数组不会执行此方法，并且它只对数组中的非空位置元素执行指定的函数，没有赋值或者已经删除的元素将被忽略**
- 返回值是一个新数组，不会改变现有的数组

```js
// 获取小于 35 的元素
var ages = [32, 33, 16, 40];
var arr = ages.filter(function (item) {
  return item < 35;
});
console.log(arr); // [32, 33, 16]
```

### indexOf() 方法：返回某个指定的元素在数组指定范围内首次出现的位置

从数组的开头（或指定位置）开始查找，找到第一个相等的元素后返回该元素在整个数组中的对应索引值；找不到返回 -1。

传递两个参数：indexOf(item, start)

- 参数 1： 必需，进行查找的元素
- 参数 2： 可选。开始查找的起始位置，默认为 0。合理取值是 [0, length)，且必须为整数。可接受负值，意为从倒数第几个开始
- 搜索是正方向进行的。
- 搜索范围是 [start, length)

```js
var fruits = [
  "Banana",
  "Orange",
  "Apple",
  "Mango",
  "Banana",
  "Orange",
  "Apple",
];
var a = fruits.indexOf("Orange"); // 1
var b = fruits.indexOf("Orange", 4); // 5
var c = fruits.indexOf("orange"); // -1
```

### lastIndexOf()方法：返回某个指定的元素在数组指定范围内最后一次出现的位置

从数组的末尾（或指定位置）开始查找，找到第一个相等的元素后返回该元素在整个数组中的对应索引值；找不到返回 -1。

传递两个参数：lastIndexOf(item, start)

- 参数 1： 必需，进行查找的元素
- 参数 2： 可选。开始查找的起始位置，默认为 0。合理取值是 [0, length)，且必须为整数。可接受负值，意为从倒数第几个开始
- 搜索是反方向进行的。
- 搜索范围是 [0, start]

```js
var fruits = [
  "Banana",
  "Orange",
  "Apple",
  "Mango",
  "Banana",
  "Orange",
  "Apple",
];
var a = fruits.lastIndexOf("Orange"); // 5
var b = fruits.lastIndexOf("Orange", 4); // 1
var c = fruits.lastIndexOf("Orange", 5); // 5
var d = fruits.lastIndexOf("orange"); // -1
```

### map() 方法：返回一个新数组，数组中的元素为原始数组元素调用函数处理后的值

传递两个参数 map(function(currentValue, index, arr), thisValue)

- 参数 1：必需，且必须是函数。**函数还必须有返回值，返回当前元素在函数中根据自定义逻辑处理过程计算的结果**
  > 此函数的要求：
  >
  > - 参数 1：必需，进行逻辑处理的当前元素，数组中的每个元素都会被依次传入
  > - 参数 2：可选，当前元素的索引值
  > - 参数 3：可选，当期元素属于的数组对象
  > - 注意不要写成 箭头函数，否则无法指定当前函数的 this 指向；this 默认指向 window
- 参数 2：可选。对象作为回调函数的 this 的值。如果省略了 thisValue，this 默认指向 window
- 对数组中的每个元素都执行一次指定的函数（callback），在函数内部对每一个元素进行自定义逻辑处理。map 方法会创建一个新的数组，该数组元素是所有在回调函数根据自定义逻辑处理过程计算的结果的返回值。**空数组不会执行此方法，并且它只对数组中的非空位置元素执行指定的函数，没有赋值或者已经删除的元素将被忽略**
- 返回值是一个新数组，不会改变现有的数组

```js
// 将数组中的每个元素都 乘以2，得到一个新数组
var fruits = [1, 2, 3, 4, 5, 6];
var arr = fruits.map(function (item) {
  return item * 2;
});
console.log(arr); // [2, 4, 6, 8, 10, 12]
```

### reduce() 方法接收一个函数作为累加器，将数组中的每个值（从左到右）依次开始累加，最终计算为一个值

接受两个参数，reduce(function(total, currentValue, currentIndex, arr), initialValue)

- 参数 1：必需，且必须是函数。**函数还必须有返回值，返回每一次累加计算的结果**
  > - 此函数的要求：
  > - 参数 1：必需，含义为每一循环的累加起始值。上一次累加后的值会作为下一循环的累加起始值
  > - 参数 2：必需，进行累加的当前元素，数组中的每个元素都会被依次传入
  > - 参数 3：可选，当期元素属于的数组对象
  > - 参数 4：可选，当前元素所属的数组对象
- 参数 2：可选。传递给函数的累加初始值，即 total 的默认值；若不传递，则为数组中第一个元素的值，同时 currentValue 从数组中的第二个值开始向函数内传递
- 对数组中的每个元素都执行一次指定的函数（callback），在函数内部对每一个元素与上一循环累加的结果（累计起始值）相加，同时将新的累加结果返回，作为下一循环的累计起始值。**空数组不会执行此方法，并且它只对数组中的非空位置元素执行指定的函数，没有赋值或者已经删除的元素将被忽略**
- 返回值是数组元素累加的结果，不会改变现有的数组

```js
var nums = [1, 2, 3, 4, 5, 6];
var sum = nums.reduce(function (total, item) {
  return total + item;
}, 30);
console.log(sum); // 51
```

> reduce() 和 reduceRight() 作用相同。reduce() 是数组中从左向右累加，reduceRight() 是从右向左累加

### forEach()方法：调用数组的每个元素，并将元素传递给回调函数。

传递两个参数 forEach(function(currentValue, index, arr), thisValue)

- 参数 1：必需，回调函数。
  > - 此函数的要求：
  > - 参数 1：必需，进行逻辑处理的当前元素，数组中的每个元素都会被依次传入
  > - 参数 2：可选，当前元素的索引值
  > - 参数 3：可选，当期元素属于的数组对象
  > - 注意不要写成 箭头函数，否则无法指定当前函数的 this 指向；this 默认指向 window
- 参数 2：可选。对象作为回调函数的 this 的值。如果省略了 thisValue，this 默认指向 window
- 对数组中的每个元素都执行一次指定的函数（callback），函数不需要设置返回值，只是依次让筛选出每个元素执行同一个操作
- 对于空数组是不会执行回调函数的

```js
var nums = [1, 2, 3, 4, 5, 6];
var sum = 0;
nums.forEach(function (item) {
  sum += item;
}, 30);
console.log(sum); // 21
```
