import UIKit

class CGPathModifier {
   /**
    * Translates PARAM: path
    * NOTE: the path is returned for the sake of convenience
    * NOTE: there is also: CGPathCreateCopyByTransformingPath
    * EXAMPLE: CGPathModifier.translate(&path,20,20)
    * CAUTION: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
    */
   @discardableResult
   static func translate( path:inout CGMutablePath, p:CGPoint) -> CGMutablePath{
      var transformation:CGAffineTransform = CGAffineTransform(translationX: p.x, y: p.y)//swift 3 was -> CGAffineTransformMakeTranslation(x,
      path = path.mutableCopy(using: &transformation)!//swift 3 , was-> CGPathCreateMutableCopyByTransformingPath
      return path
   }
   /**
    * Rotates PARAM: path
    * EXAMPLE: CGPathModifier.rotate(path:path,angle:CGFloat.pi/4.0)//45deg
    * CAUTION: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
    */
   @discardableResult
   static func rotate(path:inout CGMutablePath, angle:CGFloat) -> CGPath{
      var transformation:CGAffineTransform  = CGAffineTransform(rotationAngle: angle)//swift 3-> was: CGAffineTransformMakeRotation
      path = path.mutableCopy(using: &transformation)!
      return path
   }
   /**
    * Rotates a path around its center axis
    */
   @discardableResult
   static func centerRotate(path:inout CGMutablePath, angle:CGFloat) -> CGPath{
      let rect = path.boundingBox
      let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height)/2)
      CGPathModifier.translate(path: &path, p: offset)
      CGPathModifier.rotate(path:&path,angle:-CGFloat.pi/2.0)//45deg
      let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height)/2)
      CGPathModifier.translate(path: &path, p: reOffset)
      return path
   }
}


class CGRectParser{
   /**
    * EXAMPLE: roundRect(CGRect rect, CGFloat radius)
    */
   static func roundRect(rect:CGRect, radius:CGFloat) -> CGMutablePath{
      let path:CGMutablePath = CGMutablePath()
      path.move(to:CGPoint(x:rect.midX, y:rect.minY))//was-> CGPathMoveToPoint
      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.maxY), radius: radius)//Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.maxY), radius: radius)
      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.minY), radius: radius)
      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.minY), radius: radius)
      path.closeSubpath()
      return path
   }
   /**
    * Returns a path with straight lines derived from an array of points (think follow the dots)
    * TODO: ⚠️️ shouldn't this path be closed by a real close call?
    * NOTE: effectivly it creates a PolyLine,
    * EXAMPLE:
    * let triangle = TriangleMath.equilateralTriangle(height: 100)
    * let points:[CGPoint] = [triangle.a,triangle.b,triangle.c]
    * let cgPath = CGPathParser.polyLine(points:points, close: true)
    * let shapeLayer:CAShapeLayer = .init()
    * CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
    * self.view.layer.addSublayer(shapeLayer)
    */
   static func polyLine(points:[CGPoint], close:Bool = false, offset:CGPoint = .init(x:0,y:0)) -> CGMutablePath{
      let path:CGMutablePath = CGMutablePath()
      if points.count > 0 { path.move(to: CGPoint(x:points[0].x+offset.x, y:points[0].y+offset.y))}
      for i in 1..<points.count{
         //Swift.print("LineTo: x:  \(points[i].x+offset.x) y:  \(points[i].y+offset.y)")
         path.addLine(to: CGPoint(x:points[i].x+offset.x, y:points[i].y+offset.y))
      }
      if close {
         path.addLine(to: CGPoint(x:points[0].x+offset.x, y:points[0].y+offset.y))/*closes it self to the start position*/
         path.closeSubpath()/*it may not be necessary to have the above line when you call this method*/
      }
      return path
   }
}
