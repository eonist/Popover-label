import UIKit
/**
 * Style (Defaults)
 */
extension PopoverLabel{
   public static let defaultStyle:Style = (arrowBoxStyle:ArrowBox.defaultArrowBoxStyle, text:defaultTextStyle, margin:defaultMargin, shadow:defaultShadowStyle)
   private static let defaultMargin:UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
   private static let defaultTextStyle:TextStyle = (font:.systemFont(ofSize: 18),textColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   private static let defaultShadowStyle:ShadowStyle = (color:.gray,opacity:0.6,offset:.init(width: 0, height: 0),radius:4)
}
/**
 * Style (Signature)
 */
extension PopoverLabel{
   public typealias Style = (arrowBoxStyle:ArrowBox.ArrowBoxStyle, text:TextStyle, margin:UIEdgeInsets, shadow:ShadowStyle)
   public typealias TextStyle = (font:UIFont,textColor:UIColor)
   public typealias ShadowStyle = (color:UIColor,opacity:Float,offset:CGSize,radius:CGFloat)
}
