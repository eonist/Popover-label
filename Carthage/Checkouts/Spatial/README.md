# Spatial
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.2-orange.svg)
[![codebeat badge](https://codebeat.co/badges/b4ee0d27-b00c-464b-b9b2-c9906cb6c19f)](https://codebeat.co/projects/github-com-eonist-spatial-master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<img width="900" alt="img" src="https://rawgit.com/stylekit/img/master/spatial_github.svg">

Definition: **Spatial** | ˈspeɪʃ(ə)l | adjective | **describes how objects fit together in space**

### What is it
Hassle-free AutoLayout, tailored for interactivity and animation.

### How does it work
- Spatial is just extensions and enums which enable you to write less boilerplate code
- Spatial is interchangeable with Vanilla AutoLayout
- Spatial comes with examples how you can animate with AutoLayout
- Spatial uses plain and simple math under the hood.

### How do I get it
- Carthage `github "eonist/Spatial" "master"`
- Manual Open `Spatial.xcodeproj`
- CocoaPod (Coming soon)

### Example:

```swift
/*Single*/
btn1.activateAnchorAndSize{ view in
   let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
   let size = Constraint.size(view, size: CGSize.init(width: 96, height: 24))
   return (anchor,size)
}
```

```swift
/*Bulk*/
[btn1,btn2,btn3].activateAnchorsAndSizes { views in
   let anchors = Constraint.distribute(vertically: views, align: .topLeft)
   let sizes = views.map{Constraint.size($0, size: CGSize(width:96,height:42))}
   return (anchors, sizes)
}
```

```swift
/*Animation*/
btn.animate(to:100,align:left,alignTo:.left)
```
### Todo:
- Complete the spaceAround and spaceBetween methods
- Add one-liner accessors
- Watch https://www.youtube.com/watch?v=bJI6z-7uNGQ
- Read https://savvyapps.com/blog/advanced-ios-animations-with-auto-layout
- Make examples with AutoLayout margins 👈
