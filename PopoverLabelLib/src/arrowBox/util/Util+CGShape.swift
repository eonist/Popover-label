import UIKit

class CGShapeUtil {
   /**
    * Add color to shape
    * - parameter shape: the shape for the fill to be applied to
    * - parameter cgPath: the cgPath to fill inside
    * - parameter fillColor: the color to apply to the shape
    */
   static func fill(shape:CAShapeLayer, cgPath:CGPath, fillColor:UIColor){
      shape.path = cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
      shape.fillColor = fillColor.cgColor
   }
}
