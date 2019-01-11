#if os(iOS)
import UIKit
/**
 * Single
 */
public extension ConstraintKind where Self:UIView{
   /**
    * Cobinational types and closure signatures
    * Note: This could be useful in a global domain, for now just access it by: ConstraintKind.UIViewConstraintKind
    */
   public typealias UIViewConstraintKind = UIView & ConstraintKind
   public typealias AnchorAndSize = (anchor:AnchorConstraint, size:SizeConstraint)
}
/**
 * Bulk
 */
extension Array where Element:ConstraintKind.UIViewConstraintKind{
   public typealias ConstraintsClosure = (_ views:[UIView]) -> AnchorConstraintsAndSizeConstraints
}
#endif
