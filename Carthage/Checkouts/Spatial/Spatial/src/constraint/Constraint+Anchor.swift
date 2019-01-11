#if os(iOS)
import UIKit
/**
 * Positional constraints
 * DESCRIPTION: (Aligning relative to another view (x,y))
 * Discussion: Snapkit and Carthography are too clever and caters to too many facets of autolayout. This library is just a simple extension that does basic autolayout while reducing the setup time in half.
 * TODO: ⚠️️ Not really an anchor, consider renaming to ConstraintAttribute or pin, point, origin, position? or?
 * Discussion: anchor is a more appropriate name than, pin,pos,pt,edge,put,magnet,align,corner (anchor can represent both corner,edge and center)
 */
public class Constraint {
   /**
    * Creates a positional constraint
    * - parameter useMargin: This works, but when you use size constraints then you have to pin to sides, or use the sizeOffset
    * ## Examples:
    * activateAnchorAndSize { view in
    *    let a = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
    *    let s = Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
    *    return (a,s)
    * }
    */
   public static func anchor(_ view:UIView, to:UIView, align:Alignment, alignTo:Alignment, offset:CGPoint = CGPoint(), useMargin:Bool = false) -> AnchorConstraint {/*,offset:CGPoint = CGPoint()*/
      let horizontal:NSLayoutConstraint = Constraint.anchor(view, to: to, align: align.horAlign, alignTo: alignTo.horAlign,offset:offset.x,useMargin:useMargin)
      let vertical:NSLayoutConstraint = Constraint.anchor(view, to: to, align: align.verAlign, alignTo: alignTo.verAlign,offset:offset.y,useMargin:useMargin)
      return (horizontal,vertical)
   }
   /**
    * Horizontal
    */
   public static func anchor(_ view:UIView, to:UIView, align:HorizontalAlign, alignTo:HorizontalAlign, offset:CGFloat = 0, useMargin:Bool = false) -> NSLayoutConstraint {/*,offset:CGPoint = CGPoint()*/
      return NSLayoutConstraint(item: view, attribute: Util.layoutAttr(align:align), relatedBy: .equal, toItem: to, attribute: Util.layoutAttr(align:alignTo,useMargin:useMargin), multiplier: 1.0, constant: offset)
   }
   /**
    * Vertical
    */
   public static func anchor(_ view:UIView, to:UIView, align:VerticalAlign, alignTo:VerticalAlign, offset:CGFloat = 0, useMargin:Bool = false) -> NSLayoutConstraint {/*,offset:CGPoint = CGPoint()*/
      let attr = Util.layoutAttr(align:align)
      let relatedByAttr = Util.layoutAttr(align:alignTo,useMargin:useMargin)
      return NSLayoutConstraint(item:view, attribute:attr , relatedBy:.equal, toItem:to, attribute:relatedByAttr, multiplier:1.0, constant:offset)
   }
}
/**
 * Internal helper methods
 * TODO: ⚠️️ Move these methods to Util class and see if code-quality improves
 */
fileprivate class Util{
   /**
    * x (internal)
    */
   static func layoutAttr(align:HorizontalAlign, useMargin:Bool = false) -> NSLayoutConstraint.Attribute{
      switch align{
      case .left: return useMargin ? NSLayoutConstraint.Attribute.leftMargin : NSLayoutConstraint.Attribute.left //fatalError("err")
      case .right: return useMargin ? NSLayoutConstraint.Attribute.rightMargin : NSLayoutConstraint.Attribute.right
      case .centerX: return useMargin ? NSLayoutConstraint.Attribute.centerXWithinMargins : NSLayoutConstraint.Attribute.centerX
      }
   }
   /**
    * y (internal)
    */
   static func layoutAttr(align:VerticalAlign, useMargin:Bool = false) -> NSLayoutConstraint.Attribute{
      switch align{
      case .top: return useMargin ? NSLayoutConstraint.Attribute.topMargin : NSLayoutConstraint.Attribute.top
      case .bottom: return useMargin ? NSLayoutConstraint.Attribute.bottomMargin : NSLayoutConstraint.Attribute.bottom
      case .centerY: return useMargin ? NSLayoutConstraint.Attribute.centerYWithinMargins : NSLayoutConstraint.Attribute.centerY
      }
   }
}
#endif
