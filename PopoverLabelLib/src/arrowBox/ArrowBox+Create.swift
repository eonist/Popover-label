import UIKit
import With

/**
 * Utility
 */
extension ArrowBox {
   /**
    * Creates cgPath
    * - parameter rect: the origin and size of the resulting path
    * - parameter style: Uses the isRound and arrowHeight values
    */
   internal static func createPath(rect: CGRect, style: ArrowBoxStyle) -> CGMutablePath{
      let (p1, a, b, c, p2, p3, p4): ArrowBoxPoints = ArrowBox.createPoints(rect: rect, arrowStyle: style.arrowStyle)
      /*Triangle*/
      return with(.init()) {
         $0.move(to: p4)
         $0.addArc(tangent1End: p1, tangent2End: p2, radius: style.radius)
         if style.arrowStyle.isRounded {/*Rounded arrow*/
            $0.addArc(tangent1End: a, tangent2End: b, radius: style.radius / 1)
            $0.addArc(tangent1End: b, tangent2End: c, radius: style.radius / 4)
            $0.addArc(tangent1End: c, tangent2End: p2, radius: style.radius / 1)
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
   }
   /**
    * Returns the points that represents the arrowBox
    * - parameter rect: The origin and size of the arrowBox
    * - parameter arrowStyle: height and isRound
    */
   internal static func createPoints(rect: CGRect, arrowStyle: ArrowStyle) -> ArrowBoxPoints {
      let rect: CGRect = .init(origin:.init(x:rect.origin.x,y:rect.origin.y+arrowStyle.height),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: arrowStyle.height)
      let p1: CGPoint = .init(x: rect.origin.x, y: rect.origin.y)
      let arrow:(a: CGPoint, b: CGPoint, c: CGPoint) = {
         let a: CGPoint = .init(x: p1.x + (rect.width / 2) - adjacentSide, y: rect.origin.y )
         let b: CGPoint = .init(x: p1.x + (rect.width / 2), y: rect.origin.y - arrowStyle.height)
         let c: CGPoint = .init(x: p1.x + (rect.width / 2) + adjacentSide, y: rect.origin.y)
         return (a, b, c)
      }()
      let p2 = CGPoint.init(x: rect.origin.x + rect.width, y: rect.origin.y)
      let p3 = CGPoint.init(x: rect.origin.x + rect.width, y: rect.origin.y + rect.height)
      let p4 = CGPoint.init(x: rect.origin.x, y: rect.origin.y + rect.height)
      return (p1, arrow.a, arrow.b, arrow.c, p2, p3, p4)
   }
}
