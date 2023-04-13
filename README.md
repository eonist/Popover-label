![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)
[![codebeat badge](https://codebeat.co/badges/d719ea56-5725-4aa9-bd95-12e2b0a914ad)](https://codebeat.co/projects/github-com-eonist-popover-label-master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift](https://github.com/eonist/Popover-label/actions/workflows/swift.yml/badge.svg)](https://github.com/eonist/Popover-label/actions/workflows/swift.yml)

# Popover-label

<img width="320" alt="img" src="https://github.com/stylekit/img/blob/master/popover-label-2.gif?raw=true">

### What is it
Popover label for iOS

### How does it work
- [x] Dynamically scales to text content
- [x] Scale & Opacity Intro/Outro animation
- [x] Animates from arrow origin
- [x] Uses AutoLayout
- [x] Customizable through extension overridable methods
- [x] Rounded corners
- [x] Positional arrow (Top/Bottom)
- [x] Dropshadow (Stylable)
- [x] Aesthetically accurate equilateral based arrow
- [x] Optionally rounded arrow

### How do I get it
- Carthage `github "eonist/Popover-label" "master"`
- Manual Open `.xcodeproj`
- CocoaPod (Coming soon)

### Dependencies
- [Spatial](https://github.com/eonist/Spatial)
- [With](https://github.com/eonist/With)

### Example:
```swift
let label:PopoverLabel = .init(text:"♥ 4",style:PopoverLabel.defaultStyle,alignment:.bottom)
self.view.addSubview(label)
label.hide()/*Set init state to hidden*/
label.intro()/*Begins the looping animation*/
```
