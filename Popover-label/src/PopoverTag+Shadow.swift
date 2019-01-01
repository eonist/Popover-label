import UIKit
import With
/**
 * Util for applying rounded corners and shadow
 */
extension PopoverTag{
   /**
    * Shadow
    */
   static func applyShadow(view:UIView,path:CGPath,style:ShadowStyle){
      with(view.layer) {
         $0.shadowPath = path
         $0.shadowColor = style.color.cgColor
         $0.shadowOpacity = style.opacity
         $0.shadowOffset = style.offset
         $0.shadowRadius = style.radius
         $0.masksToBounds = false
      }
   }
}
