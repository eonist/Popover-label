import UIKit
/**
 * Utility
 */
extension ArrowBox {
   /**
    * Rotate path 90deg
    * - parameter rect: needed to translate correctly
    * - parameter cgPath: the path to be manipulated
    * - parameter arrowHeight: the height of the arrow
    * - Note: We have to have the height of the entire shape to find the correct pivot
    * - ToDo: ⚠️️ rather use cgPath.boundingBox to flip the path
    */
   static func flipPath(rect: CGRect, cgPath:inout CGMutablePath, arrowHeight: CGFloat) {
      let offset: CGPoint = .init(x: -rect.width / 2, y: -(rect.height + arrowHeight) / 2)
      CGPathModifier.translate(path: &cgPath, p: offset)
      CGPathModifier.rotate(path: &cgPath, angle: -CGFloat.pi / 1.0)//45deg
      let reOffset: CGPoint = .init(x:rect.width / 2, y: (rect.height + arrowHeight) / 2)
      CGPathModifier.translate(path: &cgPath, p: reOffset)
   }
}
