import UIKit
import With
/**
 * Util
 */
extension PopoverTag{
   /**
    * Creates the Arrow box graphics
    */
   static func createArrowBox(rect:CGRect, arrowHeight:CGFloat, style:Style) -> CAShapeLayer{
      let rect:CGRect = CGRect.init(origin:.init(x:rect.origin.x,y:rect.origin.y+arrowHeight),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: arrowHeight)
      let p1 = CGPoint.init(x:rect.origin.x,y:rect.origin.y)
      let a = CGPoint.init(x: p1.x+(rect.width/2)-adjacentSide, y: rect.origin.y )
      let b = CGPoint.init(x: p1.x+(rect.width/2), y: rect.origin.y-arrowHeight)
      let c = CGPoint.init(x: p1.x+(rect.width/2)+adjacentSide, y: rect.origin.y)
      let p2 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y)
      let p3 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y+rect.height)
      let p4 = CGPoint.init(x:rect.origin.x, y:rect.origin.y+rect.height)
      let cgPath:CGMutablePath = with(.init()) {
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
      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: style.color)
      return shapeLayer
   }
}
