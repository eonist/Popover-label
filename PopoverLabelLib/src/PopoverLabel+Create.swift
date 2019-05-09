import UIKit
import With
import Spatial
/**
 * Create
 */
extension PopoverLabel {
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
         let offset: CGPoint = .init(x: 0, y: Metric.offsetY(self))
         $0.anchor(to: self, align: .centerCenter, alignTo: .centerCenter, offset: offset)
      }
   }
   /**
    * Creates the background layer
    */
   internal func createArrowBox() -> CAShapeLayer {
      let arrowBox: ArrowBox = .init(rect: self.bounds, style: style.arrowBoxStyle, alignment: self.alignment)
      self.layer.insertSublayer(arrowBox, at: 0)/*⚠️️ If you just add the sublayer it will be above even subviews*/
      return arrowBox
   }
}
