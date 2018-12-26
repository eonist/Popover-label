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
      if let path = backgroundLayer.path {
         PopoverTag.applyShadow(view: self, path: path)
      }
      
      //UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
   }
}
/**
 * Style
 */
extension PopoverTag{
   static let defaultStyle:Style = (20,#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   typealias Style = (radius:CGFloat,color:UIColor,textColor:UIColor)
}

