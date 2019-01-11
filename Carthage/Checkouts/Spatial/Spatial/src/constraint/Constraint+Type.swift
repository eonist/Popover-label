#if os(iOS)
import UIKit
/*Single*/
public typealias AnchorConstraint = (x:NSLayoutConstraint,y:NSLayoutConstraint)
public typealias SizeConstraint = (w:NSLayoutConstraint,h:NSLayoutConstraint)
/*Bulk*/
public typealias AnchorConstraintsAndSizeConstraints = (anchorConstraints:[AnchorConstraint],sizeConstraints:[SizeConstraint])
/**
 * Single
 */
extension UIView{
   /*We keep AnchorsAndSizes in a tuple, because applyConstraints wouldn't work with just an array*/
   public typealias AnchorsAndSizes = (anchors:[NSLayoutConstraint],sizes:[NSLayoutConstraint])//can this go to [UIView].AnchorsAndSizes  ?
   public typealias ConstraintClosure = (_ view:UIView) -> [NSLayoutConstraint]
   /*Tuple*/
   public typealias AnchorAndSize = (anchor:AnchorConstraint,size:SizeConstraint)
   public typealias ConstraintsClosure = (_ view:UIView) -> AnchorAndSize
   /*Single*/
   public typealias AnchorClosure = (_ view:UIView) -> AnchorConstraint
   public typealias SizeClosure = (_ view:UIView) -> SizeConstraint
}
/**
 * Bulk
 */
public extension Array where Element:UIView{
   public typealias ConstraintClosure = (_ views:[UIView]) -> AnchorConstraintsAndSizeConstraints
   public typealias AnchorConstraintsClosure = (_ views:[UIView]) -> [AnchorConstraint]
   public typealias SizeConstraintsClosure = (_ views:[UIView]) -> [SizeConstraint]
}
#endif
