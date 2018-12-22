
import UIKit

extension ViewController{
   /**
    * Creates CustomShapedShadowView instance
    */
   func createCustomShapedShadowView() -> CustomShapedShadowView{
      let customView = CustomShapedShadowView(frame:.init(origin:.zero,size:.init(width:200,height:200)))
      self.view.addSubview(customView)
      return customView
   }
}
