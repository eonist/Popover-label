
import UIKit
import With
/**
 * Util
 */
public class ArrowBoxUtil {
   /**
    * Creates the Arrow box graphics (called from the `createBackgroundLayer` method)
    * - parameter rect: This reperesents the size of the arrowBox
    * - parameter style: This represents the style you want to apply, arrowHeight and roudness is taken into account
    * - parameter alignment: If you want the arrow to be on top or bottom
    */
   static func createArrowBox(rect:CGRect, style:ArrowBoxStyle, alignment:PopoverLabel.AlignmentType) -> CAShapeLayer{
      let (p1,a,b,c,p2,p3,p4):ArrowBox = arrowBox(rect: rect, arrowStyle: style.arrowStyle)
      /*Triangle*/
      var cgPath:CGMutablePath = with(.init()) {
         $0.move(to: p4)
         $0.addArc(tangent1End: p1, tangent2End: p2, radius: style.radius)
         if style.arrowStyle.isRounded {/*Rounded arrow*/
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
      if alignment == .bottom { ArrowBoxUtil.flipPath(rect:rect, cgPath:&cgPath ,height:style.arrowStyle.height) }
      return with(.init()) {
         CGShapeUtil.fill(shape: $0, cgPath: cgPath, fillColor: style.color)
      }
   }
   /**
    * Returns the points that represents the arrowBox
    */
   private static func arrowBox(rect:CGRect, arrowStyle:ArrowStyle) -> ArrowBox{
      let rect:CGRect = CGRect.init(origin:.init(x:rect.origin.x,y:rect.origin.y+arrowStyle.height),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: arrowStyle.height)
      let p1 = CGPoint.init(x:rect.origin.x,y:rect.origin.y)
      let a = CGPoint.init(x: p1.x+(rect.width/2)-adjacentSide, y: rect.origin.y )
      let b = CGPoint.init(x: p1.x+(rect.width/2), y: rect.origin.y-arrowStyle.height)
      let c = CGPoint.init(x: p1.x+(rect.width/2)+adjacentSide, y: rect.origin.y)
      let p2 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y)
      let p3 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y+rect.height)
      let p4 = CGPoint.init(x:rect.origin.x, y:rect.origin.y+rect.height)
      return (p1,a,b,c,p2,p3,p4)
   }
   typealias ArrowBox = (p1:CGPoint,a:CGPoint,b:CGPoint,c:CGPoint,p2:CGPoint,p3:CGPoint,p4:CGPoint)
}
/**
 * Utility
 */
extension ArrowBoxUtil {
   /**
    * Rotate path 90deg
    * NOTE: We have to have the height of the entire shape to find the correct pivot
    * TODO: ⚠️️ rather use cgPath.boundingBox to flip the path
    */
   static func flipPath(rect:CGRect, cgPath:inout CGMutablePath, height:CGFloat){
      let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height+height)/2)
      CGPathModifier.translate(path: &cgPath, p: offset)
      CGPathModifier.rotate(path:&cgPath,angle:-CGFloat.pi/1.0)//45deg
      let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height+height)/2)
      CGPathModifier.translate(path: &cgPath, p: reOffset)
   }
}
/**
 * ArrowStyle
 */
extension ArrowBoxUtil{
   public typealias ArrowBoxStyle = (radius:CGFloat,color:UIColor,arrowStyle:ArrowStyle)
   public typealias ArrowStyle = (height:CGFloat,isRounded:Bool)
}
