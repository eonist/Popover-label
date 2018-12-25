# Chaplin
Animation framework

![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg) [![codebeat badge](https://codebeat.co/badges/6b9c613c-36c0-4f22-99e9-1bea15b266c1)](https://codebeat.co/projects/github-com-eonist-chaplin-master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)”

### What is it
Animation framework

### How does it work
- Chaplin uses the swift Timer class for animation
- The animations wont be as smooth as using CAAnimation
- But Chaplin will give you more freedom than apple animation
- Chaplin will use CAAnimation soon. Stay tuned

### How do I get it
- Carthage `github "eonist/Chaplin"`
- Manual Open `Chaplin.xcodeproj`
- CocoaPod (Coming soon)

### Example:
Quick one-liner:  
```swift
TimeAnimator(duration:0.3,onChange:{/*animate stuff*/},onComplete:{/*anim completed*/}).start()
```
Interpolating between 0 and 1:  
```swift
let to = self.curX + 1
let animator = TimeAnimator(duration:0.3)
animator.tick = {
	Swift.print("animator.curCount:  \(animator.curCount)")
	Swift.print("animator.progress:  \(animator.progress)")
	self.curX = TimeAnimator.interpolate(from: from, to: to, fraction: animator.progress)
	self.frame.origin.x = self.curX
}
animator.start()
```
Looping:  
```swift
animator.onComplete = {
   self.animator.reset()
   self.animator.start()
}
```

### Todo:
- Add CAAnimation
- Make project logo
