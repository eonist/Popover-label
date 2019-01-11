#if os(iOS)
import UIKit
/**
 * Update constraints (For items that are of type ConstraintKind)
 * NOTE: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 */
public extension ConstraintKind where Self:UIView{
   /**
    * One-liner for applyAnchorAndSize
    * Example: view.applyAnchorAndSize(to:self, height:100, align:.center, alignTo:.center)
    * TODO: ⚠️️ Needs the same kind of parameters as anchorAndSize uses
    */
   public func applyAnchorAndSize(to:UIView, width:CGFloat? = nil, height:CGFloat? = nil, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, multiplier:CGSize = .init(width:1,height:1), offset:CGPoint = .zero, sizeOffset:CGSize = .zero, useMargin:Bool = false) {
      self.applyAnchorAndSize { view in
         let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft, offset:offset, useMargin:useMargin)
         let size = Constraint.size(self, to:to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
         return (anchor, size)
      }
   }
   /**
    * One-liner for applyAnchor
    * Example: view.applyAnchor(to:self, align:.center, alignTo:.center)
    */
   public func applyAnchor(to:UIView, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, offset:CGPoint = .zero, useMargin:Bool = false)  {
      self.applyAnchor { view in
         return Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft,useMargin:useMargin)
      }
   }
   /**
    * One-liner for applySize
    * view.applySize(to:self)//multiplier,offset
    */
   public func applySize(to:UIView, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)) {
      self.activateSize { view in
         return Constraint.size(self, to:to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
}
#endif
