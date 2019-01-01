import UIKit
import With
import Spatial

/**
 * Create
 */
extension PopoverLabel{
   /**
    * Creates text label
    */
   func createTextLabel() -> UILabel {
      return with(.init()) {
         $0.text = self.text
         $0.font = style.text.font
         $0.textColor = style.text.textColor
         $0.textAlignment = .center
         addSubview($0)
         $0.activateAnchor { view in
            return Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter,offset:.init(x:0,y:offsetY))
         }
      }
   }
   /**
    * Creates the background layer
    */
   func createBackgroundLayer() -> CAShapeLayer{
      let shapeLayer = PopoverLabel.createArrowBox(rect: self.bounds,  style:style, alignment: self.alignment)
      self.layer.insertSublayer(shapeLayer, at: 0)/*⚠️️ If you just add the sublayer it will be above even subviews*/
      return shapeLayer
   }
}
