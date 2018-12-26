import UIKit
import With

class CustomShapedShadowView:UIView {
   var radius:CGFloat = 10 // TODO: ⚠️️ This could probably be a let or even a static
   var corners:UIRectCorner = [] /*Stores the roundCorner types*/
   var roundedShape:CAShapeLayer?//rename to roundedShapeLayer
   var bgColor:UIColor?
   var hasShadow: Bool = true
   /*Init*/
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.bgColor = .purple
   }
   /**
    * NOTE: If you're using Auto Layout, you'll need to subclass your UIView and call roundCorners in the view's layoutSubviews for optimal effect.
    */
   override func layoutSubviews() {
      super.layoutSubviews()
      self.applyAttributes()//roundCorners(corners, radius: radius, margin:margin)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
