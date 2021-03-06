import UIKit
/**
 * Style (Defaults)
 */
extension PopoverLabel {
   public static let defaultStyle: Style = (arrowBoxStyle: ArrowBox.defaultArrowBoxStyle, text: textStyle, margin: margin, shadow: ShadowUtil.defaultShadowStyle)
   private static let margin: UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
   private static let textStyle: TextStyle = (font: .systemFont(ofSize: 18), textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
}
/**
 * Style (Signature)
 */
extension PopoverLabel {
   public typealias Style = (arrowBoxStyle: ArrowBox.ArrowBoxStyle, text: TextStyle, margin: UIEdgeInsets, shadow: ShadowUtil.ShadowStyle)
   public typealias TextStyle = (font: UIFont, textColor: UIColor)
}
