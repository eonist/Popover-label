#if os(iOS)
import UIKit
/**
 * Offset horizontally or vertically
 */
public extension ConstraintKind where Self:UIView{
   /*Makes code easier to read*/
   typealias UpdateAnchorClosure = (_ superView:UIView,_ oldAnchor:AnchorConstraint) -> Void
   typealias UpdateSizeClosure = (_ superView:UIView,_ oldAnchor:SizeConstraint) -> Void
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
    * Update (size)
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
    */
   public func update(rect:CGRect, align:Alignment, alignTo:Alignment/*, multiplier:CGPoint*/){
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldAnchor = self.anchor else {Swift.print("err anchor not available");return}
      guard let oldSize = self.size else {Swift.print("err sice not available");return}
      NSLayoutConstraint.deactivate([oldAnchor.y, oldAnchor.x, oldSize.w, oldSize.h])
      let newAnchor = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo,offset:rect.origin)
      let newSize = Constraint.size(self, size: rect.size/*, multiplier: */ )
      NSLayoutConstraint.activate([newAnchor.x,newAnchor.y,newSize.w,newSize.h])
      self.anchor = newAnchor
      self.size = newSize
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
}
/**
 * Internal
 */
extension ConstraintKind where Self:UIView{
   /**
    * Internal (Anchor)
    */
   fileprivate func updateAnchor(_ closure:UpdateAnchorClosure) {
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldAnchor = self.anchor else {Swift.print("err anchor not available");return}
      closure(superview,oldAnchor)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
   /**
    * Internal (Size)
    */
   fileprivate func updateSize(_ closure:UpdateSizeClosure) {
      guard let superview:UIView = self.superview else {Swift.print("err superview not available");return}
      guard let oldSize = self.size else {Swift.print("err sice not available");return}
      closure(superview,oldSize)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
   }
}
#endif
