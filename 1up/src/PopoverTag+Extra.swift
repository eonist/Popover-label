import UIKit
import With
/**
 * Util for applying rounded corners and shadow
 */
extension PopoverTag{
   /**
    * Shadow
    */
   static func applyShadow(view:UIView,path:CGPath){
      with(view.layer) {
         $0.shadowPath = path
         $0.shadowColor = UIColor.gray.cgColor
         $0.shadowOpacity = 0.6
         $0.shadowOffset = CGSize(width: 0, height: 0)
         $0.shadowRadius = 4
         $0.masksToBounds = false
      }
   }
}
