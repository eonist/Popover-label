
import UIKit
@testable import Spatial

extension MainView{
   /**
    * Create the FlowView
    */
   func createCardView() -> CardView{
      let screenSize:CGSize = self.frame.size
      let view:CardView = CardView.init(frame: CGRect.init(origin: .zero, size: screenSize))
      self.addSubview(view)
      
      Swift.print("screenSize:  \(screenSize)")
      view.activateAnchorAndSize { view in
         let s = Constraint.size(view, size: screenSize)
         let a = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
         return (a,s)
      }
      return view
   }
}
