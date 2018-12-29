import UIKit

extension PopoverTag{
   /**
    * Vanishes the label with animation
    */
   @objc func outro(){
      UIView.animate(withDuration: 0.15, delay: 1.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
         self.hide()
      },completion:{flag in self.intro();Swift.print("outro done")})
   }
   /**
    * Makes the label appear with animation
    */
   @objc func intro(){
      UIView.animate(withDuration: 0.15, delay: 1.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
         self.show()
      },completion:{flag in self.outro();Swift.print("intro done")})
   }
}
/**
 * State
 */
extension PopoverTag{
   /**
    * Hides label
    */
   @objc func hide(){
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: self.transform, scale: .init(x:0.5,y:0.5), pivot: .init(x:0,y:-(self.bounds.height+self.style.arrow.height)/2))
      self.alpha = 0
   }
   /**
    * Shows label
    */
   @objc func show(){
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: CGAffineTransform.identity, scale: .init(x:1,y:1), pivot: .init(x:0,y:-(self.bounds.height+self.style.arrow.height)/2))
      self.alpha = 1
   }
}
