# SimpleTimer:

![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![platform](https://img.shields.io/badge/Platform-macOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What is it:
This is a simple timer class in swift that enables you to

## How does it work:
- [x] Local scoped timer
- [x] Chainable
- [x] One liners
- [x] Uses regular callbacks

## How to get it:

- Carthage: `github "eonist/SimpleTimer" "master"`
- Manual: Copy paste: `SimplerTimer.swift`

## Note:
- Mac apps go into inactive state after 60 secs. Then this timer will slow down.

## Example:

```swift
SimpleTimer(interval: 3, repeats: true){print("tick")}.start()//Ticks every 3 seconds
```

## Example:

```swift
var idx:Int = 0
/**
 * A Timer based on GCD (More reliable as it doesn't freeze if main thread is frozen)
 * - Note: The can also be used: .seconds(Int), .microseconds(Int) and .nanoseconds(Int)
 */
func timerGCD() -> () {
	DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
		Swift.print("tick: idx\(self.idx)")
		self.idx += 1
		if self.idx < 10 {self.timerGCD()}//stop at 1sec
	}
}
```
