---
title: JavaScript 对象方法
date: 2024-11-30
updateDate: 2024-11-30
tags: [编程语言, JavaScript, Object]
category:
  - 前端
  - 数据类型
image: ./cover.jpg
---

JavaScript 对象方法

## 1. 对象属性操作

### 1.1 定义（新增/修改）属性

**Object.defineProperty(obj, property, detail)**

一次只能定义一个属性

传递三个参数

- 参数 1： 需要进行定义属性的对象
- 参数 2： 进行定义的属性名
- 参数 3： 属性描述符，定义属性相关的配置信息对象
  > - 参数 3 的配置信息对象的可用属性
  > - value： 定义属性的值
  > - configurable： 设置该属性是否可以被删除，默认是 false，即不可以被删除
  > - writable: 设置该属性是否可以被修改，默认是 false，即不可以被修改
  > - enumerable: 设置该属性是否可以被枚举，默认是 false，即不可以被枚举

> 注意，使用这种方式定义的属性，默认值都是 false。但是，使用字面量声明的对象，默认值都是 true，即可删，可改，可枚举

```js
var obj = {a: 1};
Object.defineProperty(obj, 'b', {
    value: 3,
    configurable: false
})
delete obj.b
console.log(obj);  // { a: 1, b: 3 }  无法删除
```

```js
var obj = {a: 1};
Object.defineProperty(obj, 'b', {
    value: 3,
    writable: false
})
obj.b = 4
console.log(obj);  // { a: 1, b: 3 }  无法修改
```

```js
var obj = {a: 1};
Object.defineProperty(obj, 'b', {
    value: 3,
    enumerable: false
})
for(var property in obj) {
    console.log(property);  // a  无法枚举
}
```

**Object.defineProperties(obj, detail)**

可以一次性定义多个属性

传递两个参数

- 参数 1： 需要进行定义属性的对象
- 参数 2： 需要进行定义的属性及其对应的属性描述配置对象

```js
var obj = {};
Object.defineProperties(obj, {
    a: {
        value: 1,
        configurable: true,
        writable: true,
        enumerable: true
    },
    b: {
        value: 4,
        configurable: false,
        writable: false,
        enumerable: false
    }
})
```

### 1.2 属性存取器 get 和 set

在定义对象属性的属性描述符中，get 和 set 可以代替 value 和 writable 进行控制属性值的获取和写入。

```js
var obj = {};
Object.defineProperties(obj, {
    a: {
        set: function (v) {
            console.log('设置 a 属性值')
            this._a = v;
        },
        get: function () {
            console.log('获取 a 属性值')
            return this._a;
        },
        // 访问器不能和 value 或者 writable 混在一起用，否则就会报错
        // 因为访问器就代替了这两个功能
        enumerable: true,
        configurable: true
    }
})
console.log(obj.a);  // 先输出 '获取 a 属性值'，再输出 undefined
obj.a = 3;           // 输出 '设置 a 属性值'
console.log(obj.a);  // 先输出 '获取 a 属性值'，再输出 3
```

> 属性描述符只能在 Object.defineProperty 或 Object.defineProperties 中使用。

> 不要在 set 和 get 中再次对当前变量进行赋值，否则会陷入死循环。可以在变量名前添加下划线，以示区分，作为属性值传递的中介。另外，按照习惯，前面添加下划线的属性或方法，一般都认为是对象内部使用的方法，外部不能使用。

### 1.3 枚举属性

#### 使用 for...in... 语句循环遍历对象中的可枚举属性，依次输出

```js
for(property in obj) {
    // statement
}
```

property 通常是一个变量，也可以是一个可以被赋值的表达式，用于接收枚举出的属性名。obj 是一般是用于被枚举的对象。statement 是一个语句或语句块，它构成了枚举过程循环的主体。其中 property 如果是一个变量， 则可以在循环体中进行使用。

> 不可枚举属性，为继承于原型中的属性和直接定义为不可枚举的属性

基本使用 1：

```js
var obj = {a: 1, b: 2};

for(x in obj) {
    console.log(x);  // 依次输出 a, b， 类型为 字符串
}

for(x in obj) {
    console.log(obj.x);
    // 依次输出 undefined, undefined，无法通过 . 操作符来获取对应的属性值
    // 因为使用了点操作符则认为 x 是 obj 的属性名，并不是使用 a 和 b 属性名
}

for(x in obj) {
    console.log(obj[x]);
    // 依次输出 1, 2，可以通过 [] 的方式来读取对应的属性
}
```

基本使用 2：

```js
var o = { a: 1, b: 2 };

// 以 o 为原型创建 obj，其中 o 的属性均可枚举
var obj = Object.create(o);

// 设置 obj 自身可枚举的属性
obj.c = 3;
for(var prop in obj) {
    console.log(prop);
}
// c, a, b  先将自身的可枚举属性进行遍历，再对原型中的可枚举属性进行遍历
```

## 2. 对象常用方法

### 2.1 复制与合并

#### Object.assign()：用于将所有可枚举的属性的值从一个或多个源对象复制到目标对象。它将返回目标对象。

**Object.assign(target, ...sources)**

传递参数数量不定，可以传递 2 个 到 多个，参数之间使用 , 隔开

- 改变了目标对象，并返回目标对象
- 参数 1：target，目标对象
- 剩余参数：需要进行复制的多个源对象

#### 2.1.1 复制

将想要的属性合并进空一个新的空对象中，相当于复制

```js
var target = {};
var objSource = { a: 1 };
var copy = Object.assign(target, objSource);
console.log(copy);              // { a: 1 }
console.log(target);            // { a: 1 }
console.log(target === copy);   // true
```

#### 2.1.2 合并

如果目标对象与被合并对象具有相同的属性名，则属性将被新增的同名属性覆盖。再后来的同名属性将类似地覆盖早先的属性。其中函数属性也可以被合并和覆盖。

```js
var obj1 = { a: 1 }
var obj2 = { a: 2, c: 3, fn: 'fun' };
var obj3 = { fn: function () { console.log('fn') } };

Object.assign(obj1, obj2, obj3);

console.log(obj1);    // { a: 2, c: 3, fn: fn() }
obj1.fn();            // fn
```

函数也可以当做目标对象，被合并如其他属性

```js
function foo() {
    console.log('foo');
}
var obj = {
    a: 1,
    b: function () {
        console.log('b');
    }
}
Object.assign(foo, obj);
foo();       // foo
foo.b();     // b
```

#### 2.1.3 无法复制（合并）或复制（合并）异常

继承属性和不可枚举属性是不能被复制（合并）的

```js
var obj = Object.create(
    // foo 属性在原型对象中，是个继承属性
    { foo: 1 },
    {
        bar: {
            value: 2          // bar 是个不可枚举属性。
        },
        baz: {
            value: 3,
            enumerable: true  // baz 是个自身可枚举属性。
        }
    }
);
var copy = Object.assign({}, obj);
console.log(copy);            // { baz: 3 }
```

基本数据类型在被复制（合并）会先被包装为对象类型数据，之后再进行相应的操作。其中，只有字符串才能包装成为具有自身可枚举属性的对象，其他类型在复制（合并）时会被忽略

```js
var v1 = "abc";
var v2 = true;
var v3 = 10;
var v4 = Symbol("foo");
var obj = Object.assign({}, v1, null, v2, undefined, v3, v4);
console.log(obj); // { "0": "a", "1": "b", "2": "c" }
```

异常会打断接下来的复制（合并）任务

```js
<script>
    var target = Object.defineProperty({}, "foo", {
        value: 1,
        writable: false
    });
    // target 的 foo 属性是个只读属性。

    Object.assign(target, { bar: 2 }, { fun: 3, foo: 4, baz: 5 }, { a: 6 });
    // TypeError: "foo" is read-only
    // 注意这个异常是在拷贝第二个对象的 foo 属性时发生的
</script>

<script>
    // 将输出语句放在第二个 script 标签中，会跳过方法错误，能够正常输出对应的值
    console.log(target.bar);  // 2，说明第一个源对象拷贝成功了
    console.log(target.fun);  // 3，说明第二个源对象的第一个属性也拷贝成功了
    console.log(target.foo);  // 1，error，只读属性不能被覆盖，返回的值仍是复制前的值。所以第二个源对象的第二个属性拷贝失败了
    console.log(target.baz);  // undefined，异常之后 assign 方法就退出了，第三个属性是不会被拷贝到的
    console.log(target.a);    // undefined，第三个源对象更是不会被拷贝到的
</script>
```

### 2.2 使用指定的对象及其属性去创建一个新的对象

Object.create()：使用指定对象作为原型去创建一个新的对象，并可以为新对象直接添加属性

**Object.create(proto, [propertiesObject])**

- 参数 1：被指定为新创建的对象的原型对象
- 参数 2：可选，传递值为一个对象。可直接在返回值新对象中添加新属性及配置相应属性描述符（具体写法和要求与 Object.defineProperties() 的第二个参数一样）
- 抛出异常：如果 propertiesObject 参数不是 null 也不是对象，则抛出一个 TypeError 异常。

基本使用 1：

```js
var obj = {
    a: 1, b: 2
}
var baz = Object.create(obj);
console.log(baz);    // {} 空对象
console.log(baz.a);  // 1，可以访问到原对象中的属性，则说明，原对象就是新对象的原型
```

基本使用 2：

```js
var tar = { a: 1 };
var obj = Object.create(tar, {
    // p 会成为新创建对象的数据属性，省略了的属性特性默认为 false，所以属性 p 是不可写，不可枚举，不可配置的
    p: { value: 42 },
    // q 也会成
    q: { value: 12, enumerable: true, writable: true, configurable: true },
    // foo会成为新创建对象的数据属性
    foo: { value: "hello", writable: true, configurable: true },
    // bar会成为新创建对象的访问器属性
    bar: {
        configurable: false,
        get: function () { return 10 },
        set: function (value) { console.log("Setting `obj.bar` to", value) }
    }
});
console.dir(obj);      // 访问器属性不能通过 log 查看到，需使用 dir，但是能正常使用

// 获取自身属性
console.log(obj.foo);  // hello
console.log(obj.bar);  // 10

// 获取继承属性
console.log(obj.a);    // 1

obj.p = 24;
console.log(obj.p);    // 42，不可修改

for (var prop in obj) {
    console.log(prop);
    // q，由于剩余其他属性均未设置 enumerable 属性，默认为 false，不可枚举
}

console.log(delete obj.p);  // false， 删除失败
```

扩展使用：实现构造函数原型对象之间的继承

```js
function Shape() {
    this.x = 0;
    this.y = 0;
}

// 父类的原型方法
Shape.prototype.move = function(x, y) {
    this.x += x;
    this.y += y;
    console.info('Shape moved.');
};

// 子类
function Rectangle() {
    Shape.call(this); // 调用构造函数
}

// 子类继承父类
Rectangle.prototype = Object.create(Shape.prototype);
Rectangle.prototype.constructor = Rectangle;

var rect = new Rectangle();

console.log('Is rect an instance of Rectangle?', rect instanceof Rectangle);  // true
console.log('Is rect an instance of Shape?', rect instanceof Shape);          // true
rect.move(1, 1);      // Outputs, 'Shape moved.'
```

### 2.3 遍历自身可枚举属性

Object.keys()：会返回一个由一个给定对象的自身可枚举属性组成的数组。数组中属性名的排列顺序和使用 for...in 循环遍历该对象时返回的顺序一致 （两者的主要区别是 一个 for-in 循环还会枚举其原型链上的属性）

- 参数：传递一个对象
- 返回值：一个表示给定对象的所有可枚举属性的字符串数组

基本使用：

```js
var o = { a: 1, b: 2 };

// 以 o 为原型创建 obj，其中 o 的属性均可枚举
// 再添加一些不可枚举属性
var obj = Object.create(o, {
    c: { value: 3 }
});

// 设置 obj 自身可枚举的属性
obj.d = 4;

var arr = Object.keys(obj);
console.log(arr);
// ['d']  只会将自身的可枚举属性进行遍历，将遍历到的属性名放置在数组中
```

### 2.4 其它对象操作属性

- Object.freeze() 方法可以冻结一个对象，冻结指的是不能向这个对象添加新的属性，不能修改其已有属性的值，不能删除已有属性，以及不能修改该对象已有属性的可枚举性、可配置性、可写性。也就是说，这个对象永远是不可变的。该方法返回被冻结的对象。**如果某个属性的值是一个对象时，该对象是可以改变的，即次冻结方法只能进行浅冻结。**
- Object.isFrozen() 方法判断一个对象是否被冻结（frozen）。
- Object.isExtensible() 方法判断一个对象是否是可扩展的（是否可以在它上面添加新的属性）。
- Object.isSealed() 方法判断一个对象是否是密封的（sealed）。
- Object.seal() 方法可以让一个对象密封，并返回被密封后的对象。密封对象是指那些不能添加新的属性，不能删除已有属性，以及不能修改已有属性的可枚举性、可配置性、可写性，但可能可以修改已有属性的值的对象。
