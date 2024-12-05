---
title: LeetCode 力扣
date: 2024-11-30
updateDate: 2024-11-30
tags: [编程语言, JavaScript, LeetCode]
category:
  - 前端
  - LeetCode
image: ./cover.jpg
---

LeetCode 力扣

## 1. 两数之和

给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 的那 两个 整数，并返回它们的数组下标。

- 你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。
- 你可以按任意顺序返回答案。

示例 1：

- 输入：nums = [2,7,11,15], target = 9
- 输出：[0,1]
- 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

示例 2：

- 输入：nums = [3,2,4], target = 6
- 输出：[1,2]

示例 3：

- 输入：nums = [3,3], target = 6
- 输出：[0,1]

```ts
// 使用 for 循环和 indexOf 的方法实现，用时 116 ms
function twoSum(nums: number[], target: number): number[] {
    for(let i = nums, i < nums.length; i++) {
        if(nums.indexOf(target - [i], i + 1) !== -1) {
            return [i, nums.indexOf(target - [i], i + 1)]
        }
        return []
    }
};

// 使用 new Map 的方法实现，用时 72 ms
function twoSum(nums: number[], target: number): number[] {
	let _obj = new Map();
	for (let i = 0; i < nums.length; i++) {
		if (_obj.has(target - nums[i])) {
			return [_obj.get(target - nums[i]), i];
		} else {
			_obj.set(nums[i], i);
		}
	}
	return [];
}
```

## 3. 无重复字符的最长子串

给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串的长度。

示例 1：

- 输入: s = "abcabcbb"
- 输出: 3
- 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

示例 2：

- 输入: s = "bbbbb"
- 输出: 1
- 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3：

- 输入: s = "pwwkew"
- 输出: 3
- 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

```ts
// 使用 indexOf 判断当前字符如果重复，从该位置使用 substring 截取掉然后重新依次执行，用时 80 ms
function lengthOfLongestSubstring(s: string): number {
  let maxLen = 0;
  let str = "";
  for (let val of s) {
    let index = str.indexOf(val);
    str = str.substring(index + 1) + val;
    maxLen = Math.max(maxLen, str.length);
  }
  return maxLen;
}
```
