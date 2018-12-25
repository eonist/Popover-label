import Foundation

/**
 * Deprecated methods
 */
public extension UIView{
   public func activateConstraints(closure:ConstraintsClosure){
      Swift.print("⚠️️ .activateConstraints ⚠️️  is Deprecated instead use: activateAnchorAndSize")
      self.activateAnchorAndSize(closure: closure)
   }
}
public extension Array where Element:UIView{
   public func activateConstraint(closure:ConstraintClosure) {
      Swift.print("⚠️️ .activateConstraint ⚠️️  is Deprecated instead use: activateAnchorsAndSizes")
      activateAnchorsAndSizes(closure: closure)
   }
}
/**
 * DEPRECATED
 */
public extension ConstraintKind where Self:UIView{
   public func applyConstraint(closure:ConstraintsClosure) {
      Swift.print("⚠️️ .applyConstraint ⚠️️  is Deprecated instead use: applyAnchorAndSize")
      applyAnchorAndSize(closure:closure)
   }
}
