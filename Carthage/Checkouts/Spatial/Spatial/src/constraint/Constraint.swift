#if os(iOS)
import UIKit

public typealias AnchorConstraint = (x:NSLayoutConstraint,y:NSLayoutConstraint)
public typealias SizeConstraint = (w:NSLayoutConstraint,h:NSLayoutConstraint)
public typealias AnchorConstraintsAndSizeConstraints = (anchorConstraints:[AnchorConstraint],sizeConstraints:[SizeConstraint])
/**
 * Positional constraints
 * DESCRIPTION: (Aligning relative to another view (x,y))
 * Discussion: Snapkit and Carthography are too clever and caters to too many facets of autolayout. This library is just a simple extension that does basic autolayout while reducing the setup time in half.
 * TODO: ⚠️️ Not really an anchor, consider renaming to ConstraintAttribute or pin, or?
 * Discussion: anchor is a more appropriate name than, pin,pos,pt,edge,put,magnet,align,corner (anchor can represent both corner,edge and center)
 */
public class Constraint{
   /**
    * Creates a positional constraint
    * TODO: ⚠️️ Rename to pin 👌, to differentiate from anchor, point, origin, position? 🤷
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
      return NSLayoutConstraint(item: view, attribute: Constraint.layoutAttr(align), relatedBy: .equal, toItem: to, attribute: Constraint.layoutAttr(alignTo,useMargin:useMargin), multiplier: 1.0, constant: offset)
   }
   /**
    * Vertical
    */
   public static func anchor(_ view:UIView, to:UIView, align:VerticalAlign, alignTo:VerticalAlign, offset:CGFloat = 0, useMargin:Bool = false) -> NSLayoutConstraint {/*,offset:CGPoint = CGPoint()*/
      return NSLayoutConstraint(item: view, attribute: Constraint.layoutAttr(align), relatedBy: .equal, toItem: to, attribute: Constraint.layoutAttr(alignTo,useMargin:useMargin), multiplier: 1.0, constant: offset)
   }
}
/**
 * Size constraints
 * NOTE: Has a lot of NSConstraint and NSAnchor info: https://stackoverflow.com/a/26181982/5389500
 * EXAMPLE: square.translatesAutoresizingMaskIntoConstraints = false (this enables you to set your own constraints)
 * EXAMPLE: contentView.layoutMargins = UIEdgeInsetsMake(12,12,12,12)//adds margin to the containing view
 * EXAMPLE: let pos = Constraint.anchor(square,to:canvas,targetAlign:.topleft,toAlign:.topleft)
 * EXAMPLE: let size = Constraint.size(square,to:canvas)
 * EXAMPLE: NSLayoutConstraint.activate([anchor.x,anchor.y,size.w,size.h])
 */
extension Constraint{
   /**
    * Creates a dimensional constraint
    * EXAMPLE: let sizeConstraint = Constraint.size(square,to:canvas,offset:.zero,multiplier:.init(x:1,y:0.5))
    * TODO: ⚠️️ offset should be CGSize
    * TODO: Wrong, it was just a bug that the multiplier was zero 👉 ⚠️️ The offset is pointless ⚠️️ as it doesnt offset, it sets size directly with out taking in account of the to, actually it works in some cases
    * EXAMPLE: let widthConstraint = Constraint.size(square,to:canvas).w
    */
   public static func size(_ view:UIView, to:UIView, offset:CGPoint = .zero, multiplier:CGPoint = CGPoint(x:1,y:1)) -> SizeConstraint{
      let w = Constraint.width(view, to: to, offset: offset.x, multiplier: multiplier.x)
      let h = Constraint.height(view, to: to, offset: offset.y, multiplier: multiplier.y)
      return (w,h)
   }
   /**
    * EXAMPLE: let sizeConstraint = Constraint.size(square,size:CGSize(100,100))
    * TODO: ⚠️️ offset should be CGSize
    */
   public static func size(_ view:UIView, size:CGSize, multiplier:CGSize = CGSize(width:1,height:1)) -> SizeConstraint{
      let w = Constraint.width(view, width: size.width, multiplier: multiplier.width)
      let h = Constraint.height(view, height: size.height, multiplier: multiplier.height)
      return (w,h)
   }
   /**
    * Returns size tuple (based on parent and or width or height)
    * EXAMPLE: let s = Constraint.size(view, to:parent, height:48)
    * TODO: ⚠️️ offset should be CGSize
    */
   public static func size(_ view:UIView, to:UIView, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGPoint = .zero, multiplier:CGSize = CGSize(width:1,height:1))  -> SizeConstraint {
      let w:NSLayoutConstraint = {
         if let width = width { return Constraint.width(view, width: width, multiplier: multiplier.width) }
         else { return Constraint.width(view, to: to, offset: offset.x, multiplier: multiplier.width) }
      }()
      let h:NSLayoutConstraint = {
         if let height = height { return Constraint.height(view, height: height, multiplier: multiplier.height) }
         else { return Constraint.height(view, to: to, offset: offset.y, multiplier: multiplier.height) }
      }()
      return (w,h)
   }
   /**
    * Creates a width constraint (based on a CGFloat width)
    * NOTE: When AutoLayout doesnt relate to a view the multiplier doesnt take effect, so we apply the multiplier directly to the constant
    */
   public static func width(_ view:UIView, width:CGFloat, multiplier:CGFloat = 1) -> NSLayoutConstraint{
      return NSLayoutConstraint.init(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width * multiplier)//NSLayoutAttribute
   }
   /**
    * Creates a height constraint (based on a CGFloat height)
    * NOTE: When AutoLayout doesnt relate to a view the multiplier doesnt take effect, so we apply the multiplier directly to the constant
    */
   public static func height(_ view:UIView,height:CGFloat,multiplier:CGFloat = 1) -> NSLayoutConstraint{
      return NSLayoutConstraint.init(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height * multiplier)//NSLayoutAttribute
   }
   /**
    * Creates a width constraint (based on another views width constraint)
    */
   public static func width(_ view:UIView,to:UIView,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
      return NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: to, attribute: .width, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
   }
   /**
    * Creates a height constraint (based on another views width constraint)
    */
   public static func height(_ view:UIView,to:UIView,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
      return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: to, attribute: .height, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
   }
   /**
    * New
    * NOTE: Useful if you want to set a width of an object to the height of another object
    * NOTE: You can also use it on it's own view to copy width to height for instance
    * TODO: ⚠️️ Consider renaming this to side ?
    * EXAMPLE: let widthConstraint = Constraint.length(square,viewAxis:.horizontal,axis:.vertical)
    */
   public static func length(_ view:UIView, to:UIView,viewAxis:Axis,toAxis:Axis,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
      let viewAttr:NSLayoutConstraint.Attribute = viewAxis == .horizontal ? .width : .height
      let toAttr:NSLayoutConstraint.Attribute = toAxis == .horizontal ? .width : .height
      return NSLayoutConstraint(item: view, attribute: viewAttr, relatedBy: .equal, toItem: to, attribute: toAttr, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
   }
}
/**
 * Internal helper methods
 */
extension Constraint{
   /**
    * x (internal)
    */
   private static func layoutAttr(_ align:HorizontalAlign,useMargin:Bool = false) -> NSLayoutConstraint.Attribute{
      switch align{
      case .left: return useMargin ? NSLayoutConstraint.Attribute.leftMargin : NSLayoutConstraint.Attribute.left //fatalError("err")
      case .right: return useMargin ? NSLayoutConstraint.Attribute.rightMargin : NSLayoutConstraint.Attribute.right
      case .centerX: return useMargin ? NSLayoutConstraint.Attribute.centerXWithinMargins : NSLayoutConstraint.Attribute.centerX
      }
   }
   /**
    * y (internal)
    */
   private static func layoutAttr(_ align:VerticalAlign, useMargin:Bool = false) -> NSLayoutConstraint.Attribute{
      switch align{
      case .top: return useMargin ? NSLayoutConstraint.Attribute.topMargin : NSLayoutConstraint.Attribute.top
      case .bottom: return useMargin ? NSLayoutConstraint.Attribute.bottomMargin : NSLayoutConstraint.Attribute.bottom
      case .centerY: return useMargin ? NSLayoutConstraint.Attribute.centerYWithinMargins : NSLayoutConstraint.Attribute.centerY
      }
   }
}
/**
 * AutoLayout Sugar for UIView
 * NOTE: Method overloading doesn't work with closures so each method name needs to be unique 🤷
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
//   public typealias ConstraintSignature = (_ view:UIView) -> NSLayoutConstraint
   /**
    * EXAMPLE:
    * button.activateConstraint{ view in
    *      let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
    *      let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: TopBar.topBarHeight))
    *      return [anchor.x,anchor.y,size.w,size.h]
    * }
    * TODO: ⚠️️ Rename to activateConstraints, and make activateConstraint only for 1 layoutconstraint
    */
   public func activateConstraint(closure:ConstraintClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let constraints:[NSLayoutConstraint] = closure(self)/*the constraints is returned from the closure*/
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Same as activateConstraint, but returns a tuple in the closure instead of an array
    * EXAMPLE:
    * label.activateAnchorAndSize { view in
    *    let a = Constraint.anchor(view, to: self, align: .topLeft, alignTo:  .topLeft)
    *    let s = Constraint.size(view, to: self)
    *    return (a,s)
    * }
    */
   public func activateAnchorAndSize(closure:ConstraintsClosure){
      self.translatesAutoresizingMaskIntoConstraints = false
      let anchorAndSize:AnchorAndSize = closure(self)/*the constraints is returned from the closure*/
      let constraints:[NSLayoutConstraint] = [anchorAndSize.anchor.x,anchorAndSize.anchor.y,anchorAndSize.size.w,anchorAndSize.size.h]
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activate for AnchorConstraint
    */
   public func activateAnchor(closure:AnchorClosure)  {
      self.translatesAutoresizingMaskIntoConstraints = false
      let anchorConstraint:AnchorConstraint = closure(self)/*the constraints is returned from the closure*/
      let constraints:[NSLayoutConstraint] = [anchorConstraint.x,anchorConstraint.y]
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activate for SizeConstraint
    */
   public func activateSize(closure:SizeClosure){
      self.translatesAutoresizingMaskIntoConstraints = false
      let sizeConstraint:SizeConstraint = closure(self)/*the constraints is returned from the closure*/
      let constraints:[NSLayoutConstraint] = [sizeConstraint.w,sizeConstraint.h]
      NSLayoutConstraint.activate(constraints)
   }
}
/**
 * Array
 */
public extension Array where Element:UIView{
   public typealias ConstraintClosure = (_ views:[UIView]) -> AnchorConstraintsAndSizeConstraints
   public typealias AnchorConstraintsClosure = (_ views:[UIView]) -> [AnchorConstraint]
   public typealias SizeConstraintsClosure = (_ views:[UIView]) -> [SizeConstraint]
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
