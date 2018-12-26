import UIKit
import With
import Spatial

/**
 * Create
 */
extension PopoverTag{
   /**
    * Creates text label
    */
   func createTextLabel() -> UILabel{
      return with(.init()) {
         $0.text = "+1 Like"
         $0.font = .systemFont(ofSize: 32)
         $0.textColor = .white
         $0.textAlignment = .center
//         $0.backgroundColor = .orange/*debug*/
         addSubview($0)
         $0.activateAnchorAndSize { view in
            let a = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter,offset:.init(x:0,y:arrowHeight))
            let s = Constraint.size(view, to:self)
            return (a,s)
         }
      }
   }
   /**
    * Creates the background layer
    */
   func createBackgroundLayer() -> CAShapeLayer{
      let shapeLayer = PopoverTag.createArrowBox(rect: self.bounds, arrowHeight: arrowHeight, radius:20)
      self.layer.addSublayer(shapeLayer)
      return shapeLayer
   }
   
}

