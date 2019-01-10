import UIKit

/**
 * Style (Defaults)
 */
extension PopoverLabel{
   public static let defaultStyle:Style = (arrowBoxStyle:defaultArrowBoxStyle, text:defaultTextStyle, margin:defaultMargin, shadow:defaultShadowStyle)
   private static let defaultArrowBoxStyle:ArrowBoxUtil.ArrowBoxStyle = (radius:6,color:#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),arrowStyle:defaultArrowStyle)
   private static let defaultMargin:UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
   private static let defaultTextStyle:TextStyle = (font:.systemFont(ofSize: 18),textColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   private static let defaultArrowStyle:ArrowBoxUtil.ArrowStyle = (height:12,isRounded:true)
   private static let defaultShadowStyle:ShadowStyle = (color:.gray,opacity:0.6,offset:.init(width: 0, height: 0),radius:4)
}
/**
 * Style (Signature)
 */
extension PopoverLabel{
   public typealias Style = (arrowBoxStyle:ArrowBoxUtil.ArrowBoxStyle, text:TextStyle, margin:UIEdgeInsets, shadow:ShadowStyle)
   public typealias TextStyle = (font:UIFont,textColor:UIColor)
   public typealias ShadowStyle = (color:UIColor,opacity:Float,offset:CGSize,radius:CGFloat)
}
/**
 * Differentiating between having the arrow on the top and the bottom
 */
extension PopoverLabel {
   public enum AlignmentType {
      case top, bottom
   }
}
