import UIKit
import With
/**
 * Util for applying rounded corners and shadow
 */
class StyleUtil{
   /**
    * Rounded corners
    */
   static func applyRoundCorners(view:UIView,color:UIColor?,radius:CGFloat,corners:UIRectCorner) -> CAShapeLayer {
      return with(CAShapeLayer()) {/*Creates and adds CAShapeLayer to the layer stack*/
         $0.frame = view.bounds
         let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
//         let mask = CAShapeLayer()
         $0.path = path.cgPath
         $0.fillColor = color?.cgColor
//         $0.mask = mask
         //Swift.print("color?.cgColor:  \(color?.cgColor)")
//         $0.backgroundColor = color?.cgColor
         view.layer.insertSublayer($0, at: 0)/*We insert the layer at depth zero, so that other content can be above*/
      }
   }
   /**
    * Shadow
    */
   static func applyShadow(view:UIView){
      with(view.layer) {
         $0.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
         $0.shadowColor = UIColor.gray.cgColor
         $0.shadowOpacity = 0.6
         $0.shadowOffset = CGSize(width: 0, height: 0)
         $0.shadowRadius = 4
         $0.masksToBounds = false
      }
   }
}
