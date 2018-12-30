import UIKit

/**
 * Style (Defaults)
 */
extension PopoverTag{
   static let defaultStyle:Style = (radius:6,color:#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),text:defaultTextStyle,arrow:defaultArrowStyle,margin:defaultMargin,shadow:defaultShadowStyle)
   static let defaultMargin:UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
   static let defaultTextStyle:TextStyle = (font:.systemFont(ofSize: 18),textColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
   static let defaultArrowStyle:ArrowStyle = (height:12,isRounded:true)
   static let defaultShadowStyle:ShadowStyle = (color:.gray,opacity:0.6,offset:.init(width: 0, height: 0),radius:4)
}
/**
 * Style (Signature)
 */
extension PopoverTag{
   typealias Style = (radius:CGFloat,color:UIColor,text:TextStyle,arrow:ArrowStyle,margin:UIEdgeInsets,shadow:ShadowStyle)
   typealias TextStyle = (font:UIFont,textColor:UIColor)
   typealias ArrowStyle = (height:CGFloat,isRounded:Bool)
   typealias ShadowStyle = (color:UIColor,opacity:Float,offset:CGSize,radius:CGFloat)
}
/**
 * Differentiating between having the arrow on the top and the bottom
 */
extension PopoverTag {
   enum AlignmentType {
      case top, bottom
   }
}
