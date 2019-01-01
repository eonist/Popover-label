![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)
[![codebeat badge](https://codebeat.co/badges/253637d5-bb38-4755-8f65-0ae69e9211e1)](https://codebeat.co/projects/github-com-eonist-popover-label-master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

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
