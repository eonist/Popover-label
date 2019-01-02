import UIKit
import With
import Spatial

extension PopoverLabel{
   /**
    * layoutSubviews (Called from AutoLayout)
    */
   override open func layoutSubviews() {
      super.layoutSubviews()
      if self.bounds.width > 0 {
         _ = backgroundLayer
         if let path = backgroundLayer.path {//TODO: ⚠️️ store layer and path in a tuple
            PopoverLabel.applyShadow(view:self, path:path, style:style.shadow)
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
            let height = dynamicSize.height + style.margin.top + style.margin.bottom + style.arrow.height
            return Constraint.size(view, size: .init(width: width, height: height))//(w,h)
         }
      }
   }
}
