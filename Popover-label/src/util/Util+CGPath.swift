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
}
