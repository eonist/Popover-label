import UIKit

extension PopoverLabel{
   /**
    * Vanishes the label with animation
    */
   @objc open func outro(){
      UIView.animate(withDuration: 0.15, delay: 1.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
         self.hide()
      },completion:{flag in self.intro()})
   }
   /**
    * Makes the label appear with animation
    */
   @objc open func intro(){
      UIView.animate(withDuration: 0.15, delay: 1.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
         self.show()
      },completion:{flag in self.outro()})
   }
}
/**
 * State
 */
extension PopoverLabel{
   /**
    * Hides label
    */
   @objc open func hide(){
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: self.transform, scale: .init(x:0.5,y:0.5), pivot: Metric.pivot(self))
      self.alpha = 0
   }
   /**
    * Shows label
    */
   @objc open func show(){
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: CGAffineTransform.identity, scale: .init(x:1,y:1), pivot: Metric.pivot(self))
      self.alpha = 1
   }
}
