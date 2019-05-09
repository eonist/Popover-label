import UIKit

/**
 * Metric calculation
 */
extension PopoverLabel {
   struct Metric {
      /**
       * Scale from this pivot point in the scaling animation
       */
      static func pivot(_ popoverLabel: PopoverLabel) -> CGPoint {
         return popoverLabel.alignment == .top ? topCenterPivot(popoverLabel) : bottomCenterPivot(popoverLabel)
      }
      /**
       * Scale from this pivot if the arrow is on top
       */
      static func topCenterPivot(_ popoverLabel: PopoverLabel) -> CGPoint {
         return .init(x: 0, y: -(popoverLabel.bounds.height + popoverLabel.style.arrowBoxStyle.arrowStyle.height) / 2)
      }
      /**
       * Scale from this pivot if the arrow is on bottom
       */
      static func bottomCenterPivot(_ popoverLabel: PopoverLabel) -> CGPoint {
         return .init(x: 0, y: (popoverLabel.bounds.height + popoverLabel.style.arrowBoxStyle.arrowStyle.height) / 2)
      }
      /**
       * Used for aligning the textLabel
       */
      static func offsetY(_ popoverLabel: PopoverLabel) -> CGFloat {
         return popoverLabel.alignment == .top ? popoverLabel.style.arrowBoxStyle.arrowStyle.height : 0
      }
   }
}
