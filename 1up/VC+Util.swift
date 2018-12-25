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
}

class TriangleMath{
   /**
    * Returns the length from position (0,0 in a polar system)
    * NOTE: This function is reverse of Point.polar(len, angle):Point
    * NOTE: this finds the radius of a circle (magnitude)
    * Base Formula c2 = a^2 + b^2
    * NOTE: This can be used to find hypotenuse and diagonal of a Square
    * EXAMPLE: let diagonalLength:CGFloat = TriangleMath.polarToLength(x:100,y:100)
    * EXAMPLE: Swift.print("diagonalLength:  \(diagonalLength)")//141.4213562373095
    */
   static func polarToLength(x:CGFloat,y:CGFloat) -> CGFloat {
      return sqrt(pow(x, 2) + pow(y, 2))
   }
   /**
    * Returns a point, in a polar cordinate system (from 0,0), for PARAM: angle and PARAM: length
    * Return: a point on a circle where the pivot is TopLeft Corner (0,0)
    * PARAM: radius: the radius of the circle
    * PARAM: angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
    * NOTE: formula "<angle*cos*radius,angle*sin*radius>"
    * NOTE: One can also use Point.polar(radius,radian) or equivilent method in the spesific language
    * Base formula CosΘ = x/len
    * Base Formula SinΘ = y/len
    * EXAMPLE: CGPoint.polarPoint(100, π/4)//polarPoint:  (70.7106781186548, 70.7106781186547) bottomRight corner
    * NOTE: π = Double.pi
    */
   static func polar(_ radius:CGFloat, _ angle:CGFloat) -> CGPoint {
      let x:CGFloat =  (radius * cos(angle))
      let y:CGFloat =  (radius * sin(angle))
      return CGPoint(x:x, y:y)
   }
   /**
    * Returns the adjcent length in a right-angled triangle
    * NOTE: the sides in a rightangled triangle is called: Hypotenuse, opposite, and adjacent
    * NOTE: for non 60-30-90 triangles, you can use: adj = opposite / tan(Θ) ref: https://math.stackexchange.com/questions/1116018/find-adjacent-only-knowing-angle-and-opposite
    */
   static func adjacent(opposite:CGFloat) -> CGFloat{
      return TriangleMath.aABTob(opposite, 60, 30)
   }
   /**
    * Creates an equal sided triangle (equilateral triangle)
    */
   static func equilateralTriangle(height:CGFloat) -> (a:CGPoint,b:CGPoint,c:CGPoint) {
      let adjacentSide = TriangleMath.adjacent(opposite: 100)
      let hypotenuseSide = adjacentSide * 2
      //      let polarPT = TriangleMath.polar(hypotenuseSide, ㎭ * 60)
      let a = CGPoint.init(x: 0, y: height)
      let b = CGPoint.init(x: adjacentSide, y: 0)
      let c = CGPoint.init(x: hypotenuseSide, y: height)
      return (a,b,c)
   }
}

extension TriangleMath {
   /**
    * Returns the Side b of an triangle
    * Based on formula: b/SinB = a/SinA
    * NOTE: google right angle triangle to see where the sides and angles lay
    */
   static func aABTob(_ a:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
      return sin(B*Trig.rad) * (a / sin(A*Trig.rad))
   }
}

let π = CGFloat(Double.pi)/*Global variable*/
let ㎭ = π/180/*Global variable*/
class Trig{
   static let rad:CGFloat = π / 180//㎭, EXAMPLE: 90*Trig.rad//Output:π/4
}




class CGShapeUtil {
   /**
    * Draw line
    * NOTE: remember to: shapeLayer.addSublayer(lineLayer)
    * It's also possible to do this with UIBezierPath
    * let path:UIBezierPath = {
    *    let aPath = UIBezierPath.init()//cgPath: linePath
    *    aPath.move(to: p1)
    *    aPath.addLine(to: p2)
    *    aPath.close()//Keep using the method addLineToPoint until you get to the one where about to close the path
    *    return aPath
    * }()
    */
   static func drawLine(lineLayer:CAShapeLayer, line:(p1:CGPoint, p2:CGPoint), style:(stroke:UIColor,strokeWidth:CGFloat)) -> CAShapeLayer{
      let lineLayer:CAShapeLayer = .init()
      let path:CGMutablePath = CGMutablePath()
      path.move(to: line.p1)
      path.addLine(to: line.p2)
      lineLayer.path = path/*Setup the CAShapeLayer with the path, colors, and line width*/
      lineLayer.strokeColor = style.stroke.cgColor
      lineLayer.lineWidth = style.strokeWidth
      lineLayer.lineCap = .round
      return lineLayer
   }
}


class CGPathParser{
   /**
    * Returns a path with straight lines derived from an array of points (think follow the dots)
    * TODO: shouldn't this path be closed by a real close call?
    * NOTE: effectivly it creates a PolyLine,
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


extension CGPathModifier {
   /**
    * Rounded corners
    */
   //   static func applyRoundCorners(view:UIView,color:UIColor?,radius:CGFloat,corners:UIRectCorner) -> CAShapeLayer {
   //      return with(CAShapeLayer()) {/*Creates and adds CAShapeLayer to the layer stack*/
   //         $0.frame = view.bounds
   //         let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
   //         let mask = CAShapeLayer()
   //         mask.path = path.cgPath
   //         $0.mask = mask
   //         //Swift.print("color?.cgColor:  \(color?.cgColor)")
   //         $0.backgroundColor = color?.cgColor
   //         view.layer.insertSublayer($0, at: 0)/*We insert the layer at depth zero, so that other content can be above*/
   //      }
   //   }
   /**
    *
    */
   static func fill(shape:CAShapeLayer, cgPath:CGPath, fillColor:UIColor){
      shape.path = cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      shape.fillColor = fillColor.cgColor
      //      circleLayer.strokeColor = style.stroke.cgColor
      //      circleLayer.lineWidth = style.strokeWidth
      //      circleLayer.lineCap = .round
      //      circleLayer.strokeEnd = progress
   }
}


