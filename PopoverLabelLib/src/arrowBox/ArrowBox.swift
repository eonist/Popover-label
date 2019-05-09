import UIKit
import With

public class ArrowBox: CAShapeLayer {
   /**
    * Creates the Arrow box graphics (called from the `createBackgroundLayer` method)
    * - parameter rect: This reperesents the size of the arrowBox
    * - parameter style: This represents the style you want to apply, arrowHeight and roudness is taken into account
    * - parameter alignment: If you want the arrow to be on top or bottom
    */
   public init(rect: CGRect, style: ArrowBoxStyle, alignment: AlignmentType) {
      super.init()
      var cgPath = ArrowBox.createPath(rect: rect, style: style)
      if alignment == .bottom { ArrowBox.flipPath(rect: rect, cgPath: &cgPath, arrowHeight: style.arrowStyle.height) }
      CGShapeUtil.fill(shape: self, cgPath: cgPath, fillColor: style.color)
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
