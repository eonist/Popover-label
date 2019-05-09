import UIKit
import With
import Spatial

open class PopoverLabel: UIView{
   /*Variables*/
   internal let style: Style
   internal let text: String
   internal let alignment: ArrowBox.AlignmentType
   /*UI*/
   internal lazy var arrowBox: CAShapeLayer = createArrowBox()
   internal lazy var textLabel: UILabel = createTextLabel()
   /**
    * - parameter text: text inside the popoverlabel
    * - parameter Style: represents text and arrow style
    * - parameter alignement: determines the top or bottom placment of the arrow
    */
   public init(text: String, style: Style = PopoverLabel.defaultStyle, alignment: ArrowBox.AlignmentType) {
      self.style = style
      self.text = text
      self.alignment = alignment
      super.init(frame: .zero)
      _ = textLabel
   }
   /**
    * Boilerplate
    */
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
