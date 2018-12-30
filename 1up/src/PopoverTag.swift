import UIKit
import With
import Spatial

class PopoverTag:UIView{
   /*Variables*/
   let style:Style
   let text:String
   let alignment:AlignmentType
   
   /*UI*/
   lazy var backgroundLayer:CAShapeLayer = createBackgroundLayer()
   lazy var textLabel:UILabel = createTextLabel()
   /*Init*/
   init(text:String, style:Style = PopoverTag.defaultStyle, alignment:AlignmentType) {
      self.style = style
      self.text = text
      self.alignment = alignment
      super.init(frame: .zero)
//      self.layer.backgroundColor = UIColor.blue.cgColor
      _ = textLabel
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
