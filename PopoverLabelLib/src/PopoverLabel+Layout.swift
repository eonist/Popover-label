import UIKit
import With
import Spatial

extension PopoverLabel{
   /**
    * layoutSubviews (Called from AutoLayout)
    * - Note: We check if bound.width is more than zero, because this method is called twice, once when bounds are not defined yet
    */
   override open func layoutSubviews() {
      super.layoutSubviews()
      if self.bounds.width > 0 {
         _ = arrowBox
         if let path = arrowBox.path {//TODO: ⚠️️ maybe store layer and path in a tuple?
            ShadowUtil.applyShadow(view:self, path:path, style:style.shadow)
         }
      }
      activatePopViewConstraints()
   }
   /**
    * Resize to fitting height based on the "future" heights of each UI element
    */
   fileprivate func activatePopViewConstraints(){
      let dynamicSize = self.textLabel.frame.size
      if dynamicSize.width > 0 && dynamicSize.height > 0{ /*the height of the sub views must be more than zero*/
         self.activateSize { view in /*Make constraint for PopView*/
            let width = dynamicSize.width + style.margin.left + style.margin.right
            let height = dynamicSize.height + style.margin.top + style.margin.bottom + style.arrowBoxStyle.arrowStyle.height
            return Constraint.size(view, size: .init(width: width, height: height))//(w,h)
         }
      }
   }
}
