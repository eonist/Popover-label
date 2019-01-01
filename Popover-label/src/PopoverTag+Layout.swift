import UIKit
import With
import Spatial

extension PopoverTag{
   /**
    * layoutSubviews (Called from AutoLayout)
    */
   override func layoutSubviews() {
      super.layoutSubviews()
      if self.bounds.width > 0 {
         _ = backgroundLayer
         if let path = backgroundLayer.path {//TODO: ⚠️️ store layer and path in a tuple
            PopoverTag.applyShadow(view:self, path:path, style:style.shadow)
         }
      }
      activatePopViewConstraints()
   }
   /**
    * Resize to fitting height based on the "future" heights of each UI element
    */
   private func activatePopViewConstraints(){
      let dynamicSize = self.textLabel.frame.size
      if dynamicSize.width > 0 && dynamicSize.height > 0{ /*the height of the sub views must be more than zero*/
         self.activateConstraint { view in /*Make constraint for PopView*/
            let width = dynamicSize.width + style.margin.left + style.margin.right
            let w = Constraint.width(self, width: width)
            let h = Constraint.height(view, height: dynamicSize.height + style.margin.top + style.margin.bottom + style.arrow.height)
            return [w,h]
         }
      }
   }
}
