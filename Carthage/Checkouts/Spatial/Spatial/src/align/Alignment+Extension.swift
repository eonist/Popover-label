import Foundation
/**
 * Extension
 */
public extension Alignment{
   public var horAlign:HorizontalAlign {
      switch self {
      case .topLeft,.centerLeft,.bottomLeft: return .left
      case .topRight,.bottomRight,.centerRight: return .right
      case .bottomCenter,.topCenter,.centerCenter: return .centerX
      }
   }
   public var verAlign:VerticalAlign {
      switch self {
      case .topRight,.topCenter,.topLeft: return .top
      case .bottomCenter,.bottomRight,.bottomLeft: return .bottom
      case .centerRight,.centerLeft,.centerCenter: return .centerY
      }
   }
}
