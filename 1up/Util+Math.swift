import UIKit

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
      return sin(B*CGFloat(Double.pi)/180) * (a / sin(A*CGFloat(Double.pi)/180))
   }
}
