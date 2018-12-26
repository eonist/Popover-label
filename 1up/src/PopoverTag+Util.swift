import UIKit
/**
 * Util
 */
extension PopoverTag{
   /**
    * Creates the Arrow box graphics
    */
   static func createArrowBox(rect:CGRect, arrowHeight:CGFloat, style:Style) -> CAShapeLayer{
      //for height you need to get the adjecentLength
      let rect:CGRect = CGRect.init(origin:.init(x:rect.origin.x,y:rect.origin.y+arrowHeight),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: arrowHeight)
      //      let hypotenuseSide = adjacentSide * 2
      //      let polarPT = TriangleMath.polar(hypotenuseSide, ㎭ * 60)
      let p1 = CGPoint.init(x:rect.origin.x,y:rect.origin.y)
      let a = CGPoint.init(x: p1.x+(rect.width/2)-adjacentSide, y: rect.origin.y )
      let b = CGPoint.init(x: p1.x+(rect.width/2), y: rect.origin.y-arrowHeight)
      let c = CGPoint.init(x: p1.x+(rect.width/2)+adjacentSide, y: rect.origin.y)
      let p2 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y)
      let p3 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y+rect.height)
      let p4 = CGPoint.init(x:rect.origin.x, y:rect.origin.y+rect.height)
      //      let points:[CGPoint] = [p1,a,b,c,p2,p3,p4]
      //      var cgPath = CGPathParser.polyLine(points:points, close: true)
      let cgPath:CGPath = {
         let path:CGMutablePath = CGMutablePath()
         
         path.move(to: p4)
         path.addArc(tangent1End: p1, tangent2End: p2, radius: style.radius)
         path.addLine(to: a)
         path.addLine(to: b)
         path.addLine(to: c)
         path.addArc(tangent1End: p2, tangent2End: p3, radius: style.radius)
         //         path.addLine(to: p2)
         //         path.addLine(to: p3)
         path.addArc(tangent1End: p3, tangent2End: p4, radius: style.radius)
         //         path.addLine(to: p4)
         path.addArc(tangent1End: p4, tangent2End: p1, radius: style.radius)
         path.closeSubpath()
         return path
      }()
      
      //      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.maxY), radius: radius)//Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.maxY), radius: radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.minY), radius: radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.minY), radius: radius)
      
      
      
      //      let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height+arrowHeight)/2)
      //      CGPathModifier.translate(path: &cgPath, p: offset)
      //      CGPathModifier.rotate(path:&cgPath,angle:-CGFloat.pi/2.0)//45deg
      //      let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height+arrowHeight)/2)
      //      CGPathModifier.translate(path: &cgPath, p: reOffset)
      /**/
      let shapeLayer:CAShapeLayer = .init()
      
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: style.color)
      return shapeLayer
   }
}
