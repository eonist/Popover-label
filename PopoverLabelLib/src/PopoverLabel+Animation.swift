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
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: self.transform, scale: .init(x:0.5,y:0.5), pivot: pivot)
      self.alpha = 0
   }
   /**
    * Shows label
    */
   @objc open func show(){
      self.transform = CGAffineTransformParser.scaleFromPoint(transform: CGAffineTransform.identity, scale: .init(x:1,y:1), pivot: pivot)
      self.alpha = 1
   }
}
/**
 * Metric calculation
 */
extension PopoverLabel{
   /**
    * Scale from this pivot point in the scaling animation
    */
   fileprivate var pivot:CGPoint {
      return self.alignment == .top ? topCenterPivot : bottomCenterPivot
   }
   private var topCenterPivot:CGPoint {
      return .init(x:0,y:-(self.bounds.height+self.style.arrowBoxStyle.arrowStyle.height)/2)
   }
   private var bottomCenterPivot:CGPoint {
      return .init(x:0,y:(self.bounds.height+self.style.arrowBoxStyle.arrowStyle.height)/2)
   }
   /**
    * Used for aligning the textLabel
    */
   internal var offsetY:CGFloat {
      return self.alignment == .top ? style.arrowBoxStyle.arrowStyle.height : 0
   }
}
