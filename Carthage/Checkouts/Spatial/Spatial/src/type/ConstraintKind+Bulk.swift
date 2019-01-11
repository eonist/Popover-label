#if os(iOS)
import UIKit
/**
 * Update arrays of UIViewConstraintKind
 */
extension Array where Element:ConstraintKind.UIViewConstraintKind{
   /**
    * Apply constraints on an array of UIViewConstraintKind
    * Example:
    *  [label1,label2,label3].applyAnchorsAndSizes { views in
    *      let anchors = [] /*Use Constraint.distribute*/
    *      let sizes = [] /*Use views.map {Constraint.size}*/
    *      return (anchors, sizes)
    *  }
    * NOTE: Alternativly you can do: views.enumerated().map{Constraint.anchor($0.1, to: self, align: .topLeft, alignTo:.topLeft,offset:CGPoint(x:0,y:48 * $0.0))} etc
    * NOTE: If you want to apply only anchors or only sizes then just pass an empty array for either
    */
   public func applyAnchorsAndSizes(closure:ConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:AnchorConstraintsAndSizeConstraints = closure(self)/*the constraints is returned from the closure*/
      self.enumerated().forEach {
         let anchor:AnchorConstraint = constraints.anchorConstraints[$0.offset]
         let size:SizeConstraint = constraints.sizeConstraints[$0.offset]
         $0.element.setConstraint(anchor:anchor,size:size)
      }
      let layoutConstraints:[NSLayoutConstraint] = {
         let anchors = constraints.anchorConstraints.reduce([]) { $0 + [$1.x,$1.y] }
         let sizes = constraints.sizeConstraints.reduce([]) { $0 + [$1.w,$1.h] }
         return anchors + sizes
      }()
      NSLayoutConstraint.activate(layoutConstraints)
   }
}
#endif
