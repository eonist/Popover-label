#if os(iOS)
import UIKit
/**
 * Update constraints (For items that are of type ConstraintKind)
 * NOTE: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 */
public extension ConstraintKind where Self:UIView{
   /**
    * Same as UIView().activateConstraint... but also sets size and anchor constraints (ConstraintKind) (For animation etc)
    * EXAMPLE:
    * sliderBar.applyAnchorAndSize { view in
    *      let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
    *      let size = Constraint.size(view, size: size)
    *      return (anchor:anchor, size:size)//(anchor, size) 👈 also works
    * }
    * NOTE: this had to be renamed to setAndActivateConstraint, as overriding the default extension method didnt work so well when you passed the variable into a method
    */
   public func applyAnchorAndSize(closure:ConstraintsClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let constraints:AnchorAndSize = closure(self)/*the constraints is returned from the closure*/
      setConstraint(anchor: constraints.anchor, size: constraints.size)
      NSLayoutConstraint.activate([constraints.anchor.x,constraints.anchor.y,constraints.size.w,constraints.size.h])
   }
   /**
    * Apply anchor
    */
   public func applyAnchor(closure:AnchorClosure)  {
      self.translatesAutoresizingMaskIntoConstraints = false
      let anchorConstraint:AnchorConstraint = closure(self)/*the constraints is returned from the closure*/
      let constraints:[NSLayoutConstraint] = [anchorConstraint.x,anchorConstraint.y]
      self.anchor = anchorConstraint
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Apply size
    */
   public func applySize(closure:SizeClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let sizeConstraint:SizeConstraint = closure(self)/*the constraints is returned from the closure*/
      let constraints:[NSLayoutConstraint] = [sizeConstraint.w,sizeConstraint.h]
      self.size = sizeConstraint
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Convenient
    * NOTE: this could be a variable, but I guess it's not because for some reason? 🤔
    */
   public func setConstraint(anchor:AnchorConstraint, size:SizeConstraint) {
      self.anchor = anchor
      self.size = size
   }
}
#endif
