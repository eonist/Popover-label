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
   func createTextLabel() -> UILabel {
      return with(.init()) {
         $0.text = self.text
         $0.font = style.text.font
         $0.textColor = style.text.textColor
         $0.textAlignment = .center
//         $0.backgroundColor = .orange/*debug*/
         addSubview($0)
         $0.activateAnchor { view in
            let a = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter,offset:.init(x:0,y:offsetY))
//            let s = Constraint.size(view, size: .init(width:100,height:20))
            return a//(a,s)
         }
         Swift.print("$0.frame.height:  \($0.frame.height)")
      }
   }
   /**
    * Creates the background layer
    */
   func createBackgroundLayer() -> CAShapeLayer{
      let shapeLayer = PopoverTag.createArrowBox(rect: self.bounds,  style:style, alignment: self.alignment)
      self.layer.insertSublayer(shapeLayer, at: 0)/*⚠️️ If you just add the sublayer it will be above even subviews*/
      return shapeLayer
   }
}
