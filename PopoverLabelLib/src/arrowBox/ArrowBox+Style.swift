import UIKit
/**
 * ArrowStyle
 */
extension ArrowBox{
   public typealias ArrowBoxStyle = (radius:CGFloat, color:UIColor, arrowStyle:ArrowStyle)
   public typealias ArrowStyle = (height:CGFloat, isRounded:Bool)
}

/**
 * Style (Defaults)
 */
extension ArrowBox{
   public static let defaultArrowBoxStyle:ArrowBox.ArrowBoxStyle = (radius:6,color:#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),arrowStyle:defaultArrowStyle)
   private static let defaultArrowStyle:ArrowBox.ArrowStyle = (height:12,isRounded:true)
}
