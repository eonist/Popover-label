#if os(iOS)
import UIKit
/**
 * Array
 */
public extension Array where Element:UIView{
   /**
    * AutoLayout Sugar for UIView's (Multiple)
    * EXAMPLE:
    * [label1,label2,label3].activateConstraint { views in
    *      let anchors = []
    *      let sizes = []
    *      return (anchors, sizes)
    * }
    * NOTE: ⚠️️ You have to zip together anchors in some cases
    * NOTE: ⚠️️ Can we utilize activateAnchors and activateSizes in this method?
    */
   public func activateAnchorsAndSizes(closure:ConstraintClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:AnchorConstraintsAndSizeConstraints = closure(self)
         let anchors = constraints.anchorConstraints.reduce([]) { $0 + [$1.x,$1.y] }
         let sizes = constraints.sizeConstraints.reduce([]) { $0 + [$1.w,$1.h] }
         return anchors + sizes
      }()
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activates multiple anchor constraints
    */
   public func activateAnchors(closure:AnchorConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:[AnchorConstraint] = closure(self)
         let anchors = constraints.reduce([]) { $0 + [$1.x,$1.y] }
         return anchors
      }()
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activates multiple size constraints
    */
   public func activateSizes(closure:SizeConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:[SizeConstraint] = closure(self)
         let sizes = constraints.reduce([]) { $0 + [$1.w,$1.h] }
         return sizes
      }()
      NSLayoutConstraint.activate(constraints)
   }
}
#endif
