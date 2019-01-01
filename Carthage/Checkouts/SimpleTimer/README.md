# SimpleTimer:

## What is it:
This is a simple timer class in swift that enables you to:

## How does it work:
- [x] Local scoped timer
- [x] Chainable
- [x] One liners
- [x] Uses regular callbacks

## How to get it:

- Carthage: `github "eonist/SimpleTimer" "master"`
- Manual: Copy paste: `SimplerTimer.swift`

## Example:

```
SimpleTimer(interval: 3, repeats: true){print("tick")}.start()//Ticks every 3 seconds
```
