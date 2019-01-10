import UIKit

class TriangleMath{
   /**
    * Returns the adjcent length in a right-angled triangle
    * NOTE: the sides in a rightangled triangle is called: Hypotenuse, opposite, and adjacent
    * NOTE: for non 60-30-90 triangles, you can use: adj = opposite / tan(Θ) ref: https://math.stackexchange.com/questions/1116018/find-adjacent-only-knowing-angle-and-opposite
    */
   static func adjacent(opposite:CGFloat) -> CGFloat{
      return TriangleMath.aABTob(opposite, 60, 30)
   }
   /**
    * Returns the Side b of an triangle
    * Based on formula: b/SinB = a/SinA
    * NOTE: google right angle triangle to see where the sides and angles lay
    */
   static func aABTob(_ a:CGFloat,_ A:CGFloat,_ B:CGFloat) -> CGFloat {
      return sin(B*CGFloat(Double.pi)/180) * (a / sin(A*CGFloat(Double.pi)/180))
   }
}
