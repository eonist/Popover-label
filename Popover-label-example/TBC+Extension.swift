import UIKit
import Spatial
import PopoverLabelLib
import With

extension UITabBarController {
   /**
    * Creates a popover tag
    */
   @discardableResult 
   func createPopoverTag() -> PopoverLabel{
      return with(.init(text:"♥ 4",style:PopoverLabel.defaultStyle,alignment:.bottom)) {
         view.addSubview($0)
         $0.activateAnchor { view in
            let offset:CGFloat = -self.tabBar.frame.height - UIApplication.shared.statusBarFrame.height/*To get above the tabBar element*/
            return Constraint.anchor(view, to: self.view, align: .bottomCenter, alignTo: .bottomCenter, offset:.init(x:0,y:offset))
         }
         $0.hide()/*Set init state to hidden*/
         $0.intro()/*Begins the looping animation*/
      }
   }
}
