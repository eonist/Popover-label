#if os(iOS)
import UIKit
/**
 * NOTE: Convenient UIView so you don't have to add anchor and size your self
 */
open class ConstraintView:UIView,ConstraintKind{
   public var anchor:AnchorConstraint?
   public var size:SizeConstraint?
}
#endif
