import UIKit
import With
import Spatial

open class PopoverLabel:UIView{
   /*Variables*/
   internal let style:Style
   internal let text:String
   internal let alignment:AlignmentType
   /*UI*/
   internal lazy var backgroundLayer:CAShapeLayer = createBackgroundLayer()
   internal lazy var textLabel:UILabel = createTextLabel()
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
