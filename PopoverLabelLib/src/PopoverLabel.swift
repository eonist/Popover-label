import UIKit
import With
import Spatial

open class PopoverLabel:UIView{
   /*Variables*/
   let style:Style
   let text:String
   let alignment:AlignmentType
   /*UI*/
   lazy var backgroundLayer:CAShapeLayer = createBackgroundLayer()
   lazy var textLabel:UILabel = createTextLabel()
   /*Init*/
   public init(text:String, style:Style = PopoverLabel.defaultStyle, alignment:AlignmentType) {
      self.style = style
      self.text = text
      self.alignment = alignment
      super.init(frame: .zero)
      _ = textLabel
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
