import UIKit

class CustomShapedShadowView:UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .purple
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

