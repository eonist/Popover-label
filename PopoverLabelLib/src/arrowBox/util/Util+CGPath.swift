import UIKit

class CGPathModifier {
   /**
    * Translates a path
    * - Note: the path is returned for the sake of convenience
    * - Note: there is also: CGPathCreateCopyByTransformingPath
    * ## Examples:
    * CGPathModifier.translate(&path,20,20)
    * - Caution: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
    * - parameter path: the path to be translated
    * - parameter p: the point the path should be transled to
    */
   @discardableResult
   static func translate( path:inout CGMutablePath, p: CGPoint) -> CGMutablePath {
      var transformation:CGAffineTransform = CGAffineTransform(translationX: p.x, y: p.y)//swift 3 was -> CGAffineTransformMakeTranslation(x,
      path = path.mutableCopy(using: &transformation)!//swift 3 , was-> CGPathCreateMutableCopyByTransformingPath
      return path
   }
   /**
    * Rotates a path
    * ## Examples:
    * CGPathModifier.rotate(path:path,angle:CGFloat.pi/4.0)//45deg
    * - Caution: ⚠️️ When using this method remeber to use the CGPathCreateMutableCopy(somePath) if you dont want to edit the original path (THe return statment is jsut for convenince)
    * - parameter path: the path to be rotated
    * - parameter angle: the angle the path should be rotated by
    */
   @discardableResult
   static func rotate(path:inout CGMutablePath, angle:CGFloat) -> CGPath {
      var transformation:CGAffineTransform  = CGAffineTransform(rotationAngle: angle)//swift 3-> was: CGAffineTransformMakeRotation
      path = path.mutableCopy(using: &transformation)!
      return path
   }
}
