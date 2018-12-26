import UIKit
import With

extension CustomShapedShadowView{
   /**
    * Apply attributes (shadow and rounded corners)
    * NOTE: the roundedShape is a layer in the view.layer stack
    * NOTE: This is called from layoutSubViews
    */
   func applyAttributes(){
      self.layer.backgroundColor = UIColor.clear.cgColor//UIColor.clear.cgColor /*Removes the default background color of the cell*/
      self.clipsToBounds = false /*⚠️️ Removes default masking ⚠️️*/
      if hasShadow {StyleUtil.applyShadow(view:self)}
      self.roundedShape = StyleUtil.applyRoundCorners(view:self,color:bgColor,radius: radius,corners:corners)
   }
   /**
    * Sets style attributes
    * NOTE: ⚠️️ The styleAttributes are set on init but the usage of these styles are done later in layoutSubviews
    */
   func setAttributes(_ corners: UIRectCorner, radius: CGFloat/*, margin:UIEdgeInsets*/){
      self.radius = radius
      self.corners = corners
   }
}
