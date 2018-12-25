#if os(iOS)
import UIKit
/**
 * Animation
 */
public extension ConstraintKind where Self:UIView{//TODO ⚠️️ use UIViewConstraintKind
   /**
    * Animates a UIView that adhers to ConstraintKind (hor)
    * Example: btn.animate(to:100,align:left,alignTo:.left)
    */
   public func animate(to:CGFloat, align:HorizontalAlign, alignTo:HorizontalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete:onComplete)
   }
   /**
    * Anim (ver)
    */
   public func animate(to:CGFloat, align:VerticalAlign, alignTo:VerticalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete:onComplete)
   }
   /**
    * Anim (ver,hor)
    */
   public func animate(to:CGPoint, align:Alignment, alignTo:Alignment, onComplete:@escaping AnimComplete = Self.defaultOnComplete){
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete:onComplete)
   }
}
/**
 * Offset horizontally or vertically
 */
public extension ConstraintKind where Self:UIView{
   /*Makes code easier to read*/
   typealias UpdateAnchorClosure = (_ superView:UIView,_ oldAnchor:AnchorConstraint)->Void
   typealias UpdateSizeClosure = (_ superView:UIView,_ oldAnchor:SizeConstraint)->Void
   /**
    * Internal (Anchor)
    */
   private func updateAnchor(_ closure:UpdateAnchorClosure) {
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldAnchor = self.anchor else {Swift.print("err anchor not available");return}
      closure(superview,oldAnchor)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
   /**
    * Internal (Size)
    */
   private func updateSize(_ closure:UpdateSizeClosure) {
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldSize = self.size else {Swift.print("err sice not available");return}
      closure(superview,oldSize)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
   
   /**
    * Updates horizontal anchor
    */
   public func update(offset:CGFloat, align:HorizontalAlign, alignTo:HorizontalAlign){
      updateAnchor { (superview,oldAnchor) in
         NSLayoutConstraint.deactivate([oldAnchor.x])
         let newAnchorX = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
         NSLayoutConstraint.activate([newAnchorX])
         self.anchor?.x = newAnchorX
      }
   }
   /**
    * Updates vertical anchor
    */
   public func update(offset:CGFloat, align:VerticalAlign, alignTo:VerticalAlign){
      updateAnchor { (superview,oldAnchor) in
         NSLayoutConstraint.deactivate([oldAnchor.y])
         let newAnchorY = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
         NSLayoutConstraint.activate([newAnchorY])
         self.anchor?.y = newAnchorY
      }
   }
   /**
    * Update (hor & ver)
    */
   public func update(offset:CGPoint, align:Alignment, alignTo:Alignment){
      updateAnchor { (superview,oldAnchor) in
         NSLayoutConstraint.deactivate([oldAnchor.x,oldAnchor.y])
         let newAnchor = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset:offset)
         NSLayoutConstraint.activate([newAnchor.x,newAnchor.y])
         self.anchor = newAnchor
      }
   }
   /**
    * Update (size offset)
    */
   public func update(size:CGSize/*,multiplier:CGPoint*/) {
      updateSize { (superview,oldSize) in
         NSLayoutConstraint.deactivate([oldSize.w,oldSize.h])
         let newSize = Constraint.size(self, size: size/*, multiplier: */ )
         NSLayoutConstraint.activate([newSize.w,newSize.h])
         self.size = newSize
      }
   }
   /**
    * Update (size & position) offset
    * PARAM: multiplier: only applies to the size (⚠️️ NOT IMPLEMENTED YET ⚠️️)
    * IMPORTANT: ⚠️️ offset.size is actual size, not offset of the size ⚠️️
    */
   public func update(offset:CGRect, align:Alignment, alignTo:Alignment/*, multiplier:CGPoint*/){
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldAnchor = self.anchor else {Swift.print("err anchor not available");return}
      guard let oldSize = self.size else {Swift.print("err sice not available");return}
      NSLayoutConstraint.deactivate([oldAnchor.y, oldAnchor.x, oldSize.w, oldSize.h])
      let newAnchor = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo,offset:offset.origin)
      let newSize = Constraint.size(self, size: offset.size/*, multiplier: */ )
      NSLayoutConstraint.activate([newAnchor.x,newAnchor.y,newSize.w,newSize.h])
      self.anchor = newAnchor
      self.size = newSize
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
}
/**
 * Animation (Static & convenient)
 */
public extension UIView{
   public typealias AnimComplete = () -> Void
   public typealias AnimUpdate = () -> Void
   public static func defaultOnComplete() {Swift.print("default anim completed closure")}
   /**
    * Animate
    * PARAM: onUpdate is animateTo this and on every frame do this at the same time 🤔
    */
   public static func animate(_ onUpdate:@escaping AnimUpdate,onComplete:@escaping AnimComplete = UIView.defaultOnComplete) {
      let anim = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: {
         onUpdate()
      })
      anim.addCompletion{_ in onComplete() }
      anim.startAnimation()
   }
}
#endif
