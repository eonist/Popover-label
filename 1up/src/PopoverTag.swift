import UIKit
import With

class PopoverTag:UIView{
   /*Variables*/
   let arrowHeight:CGFloat
   let style:Style
   /*UI*/
   lazy var backgroundLayer:CAShapeLayer = createBackgroundLayer()
   lazy var textLabel:UILabel = createTextLabel()
   /*Init*/
   init(frame: CGRect, arrowHeight:CGFloat, style:Style = PopoverTag.defaultStyle) {
      self.arrowHeight = arrowHeight
      self.style = style
      super.init(frame: frame)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   /**
    * layoutSubviews
    */
   override func layoutSubviews() {
      super.layoutSubviews()
      Swift.print("self.bounds:  \(self.bounds)")
      _ = backgroundLayer
      _ = textLabel
      if let path = backgroundLayer.path {//TODO: ⚠️️ store layer and path in a tuple
         PopoverTag.applyShadow(view: self, path: path)
      }
      
      //UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
   }
}
