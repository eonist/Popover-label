import UIKit
import With
/**
 * Util
 */
extension PopoverTag{
   /**
    * Creates the Arrow box graphics
    */
   static func createArrowBox(rect:CGRect, style:Style, alignment:AlignmentType) -> CAShapeLayer{
      let rect:CGRect = CGRect.init(origin:.init(x:rect.origin.x,y:rect.origin.y+style.arrow.height),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: style.arrow.height)
      let p1 = CGPoint.init(x:rect.origin.x,y:rect.origin.y)
      let a = CGPoint.init(x: p1.x+(rect.width/2)-adjacentSide, y: rect.origin.y )
      let b = CGPoint.init(x: p1.x+(rect.width/2), y: rect.origin.y-style.arrow.height)
      let c = CGPoint.init(x: p1.x+(rect.width/2)+adjacentSide, y: rect.origin.y)
      let p2 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y)
      let p3 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y+rect.height)
      let p4 = CGPoint.init(x:rect.origin.x, y:rect.origin.y+rect.height)
      var cgPath:CGMutablePath = with(.init()) {
         $0.move(to: p4)
         $0.addArc(tangent1End: p1, tangent2End: p2, radius: style.radius)
         if style.arrow.isRounded {/*Rounded arrow*/
            $0.addArc(tangent1End: a, tangent2End: b, radius: style.radius/1)
            $0.addArc(tangent1End: b, tangent2End: c, radius: style.radius/4)
            $0.addArc(tangent1End: c, tangent2End: p2, radius: style.radius/1)
         } else {
            $0.addLine(to: a)
            $0.addLine(to: b)
            $0.addLine(to: c)
         }
         $0.addArc(tangent1End: p2, tangent2End: p3, radius: style.radius)
         $0.addArc(tangent1End: p3, tangent2End: p4, radius: style.radius)
         $0.addArc(tangent1End: p4, tangent2End: p1, radius: style.radius)
         $0.closeSubpath()
      }
      
      if alignment == .bottom {PopoverTag.flipPath(rect:rect, cgPath:&cgPath ,arrowHeight:style.arrow.height)}

      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: style.color)
      return shapeLayer
   }
}

extension PopoverTag {
   /**
    * Rotate path 90deg
    */
   static func flipPath(rect:CGRect, cgPath:inout CGMutablePath,arrowHeight:CGFloat){
      let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height+arrowHeight)/2)
      CGPathModifier.translate(path: &cgPath, p: offset)
      CGPathModifier.rotate(path:&cgPath,angle:-CGFloat.pi/1.0)//45deg
      let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height+arrowHeight)/2)
      CGPathModifier.translate(path: &cgPath, p: reOffset)
   }
}
