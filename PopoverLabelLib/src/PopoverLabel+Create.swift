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
   internal func createTextLabel() -> UILabel {
      return with(.init()) {
         $0.text = self.text
         $0.font = style.text.font
         $0.textColor = style.text.textColor
         $0.textAlignment = .center
         addSubview($0)
         $0.activateAnchor { view in
            return Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter, offset:.init(x:0,y:Metric.offsetY(self)))
         }
      }
   }
   /**
    * Creates the background layer
    */
   internal func createArrowBox() -> CAShapeLayer{
      let arrowBox:ArrowBox = .init(rect: self.bounds, style:style.arrowBoxStyle, alignment: self.alignment)
      self.layer.insertSublayer(arrowBox, at: 0)/*⚠️️ If you just add the sublayer it will be above even subviews*/
      return arrowBox
   }
}
