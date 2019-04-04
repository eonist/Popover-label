import UIKit
import With
/**
 * Util for applying rounded corners and shadow
 */
public class ShadowUtil{
   /**
    * Shadow
    * - Parameter view: the view to apply the shadow to
    * - Parameter path: The path to draw the shadow around, if a path is not provided the shadow simply becomes a square
    * - Parameter style: color, radius, offset, opacity
    */
   internal static func applyShadow(view:UIView,path:CGPath,style:ShadowStyle){
      with(view.layer) {
         $0.shadowPath = path
         $0.shadowColor = style.color.cgColor
         $0.shadowOpacity = style.opacity
         $0.shadowOffset = style.offset
         $0.shadowRadius = style.radius
         $0.masksToBounds = false
      }
   }
}
/**
 * ShadowUtil - types
 */
extension ShadowUtil{
   public typealias ShadowStyle = (color:UIColor,opacity:Float,offset:CGSize,radius:CGFloat)
   public static let defaultShadowStyle:ShadowUtil.ShadowStyle = (color:.gray,opacity:0.6,offset:.init(width: 0, height: 0),radius:4)
}
