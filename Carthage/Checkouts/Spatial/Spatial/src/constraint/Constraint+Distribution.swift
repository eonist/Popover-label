import UIKit
/**
 * Distribute items horizontally or vertically
 */
extension Constraint {
   /**
    * Horizontal & Vertical Distribution
    * TODO: ⚠️️ Add support for spacing
    * TODO: ⚠️️ Add support for the more universal alignment:Alignment as well
    * TODO: ⚠️️ offset and length should be a tuple
    * TODO: ⚠️️ parent is always superview, then we must use UIView as type, remember your returning constriants, not setting actual anchor or size, you do that in activeConstraint
    * IMPORTANT ⚠️️ Sets only anchors not sizes
    * EXAMPLE:
    * [label1,label2,label3].activateConstraint { views in
    *      let anchors = Constraint.distribute(vertically:views,align:.left)
    *      let sizes = Constraint.size(view, toView: self.frame.width, height: 48))
    *      return (anchors, sizes)
    * }
    * NOTE: Alternativly you can do: views.enumerated().map{Constraint.anchor($0.1, to: self, align: .topLeft, alignTo:.topLeft,offset:CGPoint(x:0,y:48 * $0.0))} etc
    */
   public static func distribute(horizontally views:[UIView], align:Alignment, spacing:CGFloat = 0, offset:CGFloat = 0) -> [AnchorConstraint] {
      let xConstraints:[NSLayoutConstraint] = distribute(views, axis:.horizontal, align:align, spacing:spacing, offset:offset)
      let yConstraints:[NSLayoutConstraint] = views.map{ view in
         guard let superView = view.superview else {fatalError("view must have superview")}
         return Constraint.anchor(view, to: superView, align: align.verAlign, alignTo: align.verAlign)}
      let anchors:[AnchorConstraint] = Array(zip(xConstraints,yConstraints))
      return anchors
   }
   /**
    * IMPORTANT ⚠️️ Sets only anchors not sizes
    */
   public static func distribute(vertically views:[UIView], align:Alignment, spacing:CGFloat = 0, offset:CGFloat = 0) -> [AnchorConstraint] {
      let xConstraints:[NSLayoutConstraint] = views.map{ view in
         guard let superView = view.superview else {fatalError("view must have superview")}
         return Constraint.anchor(view, to: superView, align: align.horAlign, alignTo: align.horAlign)
      }
      let yConstraints = distribute(views, axis:.vertical, align:align, spacing:spacing, offset:offset)
      let anchors:[AnchorConstraint] = Array(zip(xConstraints,yConstraints))
      return anchors
   }
   /**
    * Distributes vertically or horizontally
    */
   private static func distribute(_ views:[UIView], axis:Axis, align:Alignment, spacing:CGFloat = 0, offset:CGFloat = 0) -> [NSLayoutConstraint]{
      switch (align.horAlign, align.verAlign) {
      case (.left, _),(_ , .top): return distribute(fromStart:views, axis:axis, spacing:spacing, offset:offset)
      case (.right, _),(_ , .bottom): return distribute(fromEnd:views, axis:axis, spacing:spacing, offset:offset)
      default: fatalError("center not supported")
      }
   }
   /**
    * Distributes from start to end
    */
   private static func distribute(fromStart views:[UIView], axis:Axis, spacing:CGFloat = 0, offset:CGFloat = 0) -> [NSLayoutConstraint] {
//      Swift.print("distribute() fromStart")
      var anchors:[NSLayoutConstraint] = []
      var prevView:UIView?
      views.enumerated().forEach { (_,view) in
         guard let toView:UIView = prevView ?? view.superview else {fatalError("view must have superview")}
         let offset = prevView == nil ? offset : 0/*only the first view gets offset*/
         let spacing:CGFloat = prevView != nil ? spacing : 0/*all subsequent views gets spacing*/
         if axis == .horizontal {
            let alignTo:HorizontalAlign = prevView == nil ? .left : .right/*first align to left pf superView, then right of each subsequent item*/
            anchors.append(Constraint.anchor(view,to:toView,align:.left,alignTo:alignTo,offset:offset + spacing))
         }else {//.vertical
            let alignTo:VerticalAlign = prevView == nil ? .top : .bottom/*first align to top pf superView, then bottom of each subsequent item*/
            anchors.append(Constraint.anchor(view, to:toView, align:.top, alignTo:alignTo, offset:offset + spacing))
         }
         prevView = view
      }
      return anchors
   }
   /**
    * Aligns from end to start
    */
   private static func distribute(fromEnd views:[UIView], axis:Axis, spacing:CGFloat = 0, offset:CGFloat) -> [NSLayoutConstraint] {
//      Swift.print("distribute() fromEnd")
      var anchors:[NSLayoutConstraint] = []
      var prevView:UIView?
      for view in views.reversed() {/*Move backwards*/
         guard let toView:UIView = prevView ?? view.superview else {fatalError("view must have superview")}
         let offset = prevView == nil ? offset : 0
         let spacing:CGFloat = prevView != nil ? spacing : 0 /*all subsequent views gets spacing*/
         if axis == .horizontal {
            let alignTo:HorizontalAlign = prevView == nil ? .right : .left/*first align to right pf superView, then left of each subsequent item*/
            anchors.append(Constraint.anchor(view,to:toView,align:.right,alignTo:alignTo,offset:offset + spacing))
         }else {//ver
            let alignTo:VerticalAlign = prevView == nil ? .bottom : .top/*first align to bottom pf superView, then top of each subsequent item*/
            anchors.append(Constraint.anchor(view,to:toView,align:.bottom,alignTo:alignTo,offset:offset + spacing))
         }
         prevView = view
      }
      return anchors
   }
}

/**
 * Aligns one item after the other and centers their total position
 */
//static func distribute(fromCenter views:[UIConstraintView], axis:Axis, length:CGFloat, offset:CGFloat) {
//
//   //🏀 THEN DO THIS, only works with UIConstraintView where size is available
//
//   //find the totalW of all items
//   let totV:CGFloat = views.reduce(0){$0 + axis == .hor ? $1.size.width : $1.size.height}
//   //Use Align.center to find x
//   let v:CGPoint =  offset + round(length/2) - round(totV/2)//Align.alignmentPoint(CGSize(totV,0), container.size, Alignment.centerCenter, Alignment.centerCenter, CGPoint())
//   //Use justifyFlexStart and lay items out left to right with new rect as offset
//   distributeFromStart(views, axis:axis, offset:v)
//}

/**
 * Space items evenly to fill length
 */
//extension Distribution{
/**
 * Aligns all items from the absolute start to absolute end and adds equa spacing between them
 * TODO: ⚠️️ complete this
 * IMPORTANT ⚠️️ only works with UIConstraintView where size is available
 */
// public static func spaceBetween(_ views:[ConstraintKind], _ container:CGRect) {
//     let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}/*find the totalW of all items*/
//     let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
//     let numOfVoids:CGFloat = CGFloat(items.count - 1)/*then divide this voidSpace with .count - 1 and*/
//     let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
//     var x:CGFloat = container.x//interim x
//     items.forEach{ item in
//         item.flexible.x = x
//         x += item.width + itemVoid
//     }
// }
/**
 * Same as spaceBetween but does not pin to sides but rather add equal spacing there as well
 * TODO: ⚠️️ complete this
 * IMPORTANT ⚠️️ only works with UIConstraintView where size is available
 */
// public static func spaceAround(_ items:[FlexBoxItemKind], _ container:CGRect) {
//     let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}/*find the totalW of all items*/
//     let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
//     let numOfVoids:CGFloat = CGFloat(items.count)/*then divide this voidSpace with .count - 1 and*/
//     let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
//     let edgeVoid:CGFloat = itemVoid/2
//     var x:CGFloat = container.x+edgeVoid//interim x
//     items.forEach{ item in
//         item.flexible.x = x
//         x += item.width + itemVoid
//     }
// }
//}

