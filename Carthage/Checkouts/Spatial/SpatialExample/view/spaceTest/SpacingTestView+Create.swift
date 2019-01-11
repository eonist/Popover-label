import UIKit
import Spatial

//🏀
//Use the constant to calculate the width or height.
//will only work on items that has frame set on init I think
//or parse the item for the w/h constraints

/**
 * Create
 */
extension SpacingTestView{
   /**
    * Creates horizontal items
    */
   func createVerticalItems() -> [UIView] {
      let size:CGSize = .init(width: 48, height: 48)
      let views:[UIView] = [UIColor.purple,.orange,.red,.blue].map{
         let view:UIView = .init(frame: .zero)//.init(origin: .zero, size: size)
         self.addSubview(view)
         view.backgroundColor = $0
         return view
      }
      views.activateAnchorsAndSizes { views in
         let anchors = Constraint.distribute(vertically: views, align: .topLeft)
         let sizes = views.map{Constraint.size($0, size: size)}
         sizes.forEach{
            Swift.print("$0.w.constant:  \($0.w.constant)")
         }
         return (anchors, sizes)
      }
      return views
   }
}
//let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}/*find the totalW of all items*/
