import Foundation
/**
 * Extension
 */
extension AlignType{
   public var axis:Axis {
      switch self {
      case .top,.bottom,.centerVer: return .vertical
      case .left,.right,.centerHor: return .horizontal
      }
   }
   public var axisType:AxisType {
      switch self {
      case .top,.left: return .start
      case .centerHor, .centerVer: return .middle
      case .bottom,.right: return .end
      }
   }
}
