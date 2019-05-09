import UIKit

/**
 * Differentiating between having the arrow on the top and the bottom
 */
extension ArrowBox {
   public enum AlignmentType {
      case top, bottom
   }
   internal typealias ArrowBoxPoints = (p1: CGPoint, a: CGPoint, b: CGPoint, c: CGPoint, p2: CGPoint, p3: CGPoint, p4: CGPoint)
}
