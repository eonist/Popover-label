import UIKit
/**
 * Convenient extension methods for UIView
 * Definition: Convenience the state of being able to proceed with something without difficulty
 * TODO: ⚠️️ Make these methods for [UIView] as well
 */
extension UIView {
   /**
    * One-liner for activateAnchorAndSize (Align and size a UIView instance)
    * - parameter to: anchor to this view
    * - parameter sizeTo: provide this if you need to base the size on another view
    * - parameter width: provide this if you want to use a fixed width
    * - parameter height: provide this if you want to use a fixed height
    * - parameter align: alignment for the `to` view
    * - parameter alignTo: alignment for the `sizeTo` view, if one was provided
    * - parameter multiplier: multiplies the `size` or `sizeTo`
    * - parameter offset: offset for the `to` parameter
    * - parameter sizeOffset: offset for the `sizeTo` parameter
    * - parameter useMargin: aligns to autolayout margins or not
    * ## Examples:
    * view.anchorAndSize(to:self,height:100,align:.center,alignTo:.center)//multiplier
    */
   public func anchorAndSize(to:UIView, sizeTo:UIView? = nil, width:CGFloat? = nil, height:CGFloat? = nil, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, multiplier:CGSize = .init(width:1,height:1), offset:CGPoint = .zero, sizeOffset:CGSize = .zero, useMargin:Bool = false){
      self.activateAnchorAndSize { view in
         let a = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         let s:SizeConstraint = {
            if let width = width, let height = height {/*This method exists when you have size, but don't want to set size based on another view*/
               return Constraint.size(self, size: CGSize(width:width,height:height), multiplier: multiplier)
            }else {
               return Constraint.size(self, to: sizeTo ?? to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
            }
         }()
         return (a,s)
      }
   }
   /**
    * One-liner for anchor (Align a UIView instance)
    * ## Examples:
    * view.anchor(to:self,align:.center,alignTo:.center)
    */
   public func anchor(to:UIView, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, offset:CGPoint = .zero, useMargin:Bool = false){
      self.activateAnchor{ view in
         return Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
      }
   }
   /**
    * Horizontally align a UIView instance
    */
   public func anchor(to:UIView, align:HorizontalAlign = .left, alignTo:HorizontalAlign = .left, offset:CGFloat = 0, useMargin:Bool = false) {
      self.activateConstraints { view in
         return [Constraint.anchor(view, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Vertically align a UIView instance
    */
   public func anchor(to:UIView, align:VerticalAlign = .top, alignTo:VerticalAlign = .top, offset:CGFloat = 0, useMargin:Bool = false) {
      self.activateConstraints { view in
         return [Constraint.anchor(view, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Size a UIView instance
    * EXAMPLE: view.size(to:self)
    */
   public func size(to:UIView, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)){
      self.activateSize { view in
         return Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
}
