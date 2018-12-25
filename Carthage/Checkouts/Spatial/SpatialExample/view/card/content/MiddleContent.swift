import UIKit
import Spatial

class MiddleContent:UIView{
   /*UI*/
   lazy var itemViews:[ItemView] = createItemViews()
   override init(frame: CGRect) {
      super.init(frame: frame)
//      self.layer.cornerRadius = 24
      self.backgroundColor = .yellow
      _ = itemViews
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 *
 */
extension MiddleContent{
   /**
    * Create items
    */
   func createItemViews() -> [ItemView] {
      Swift.print("createItemViews: \(self.frame)")
      let size:CGSize = CGSize.init(width: self.frame.width, height: 48)
      let itemViews:[ItemView] = (0..<5).indices.map{ i in
         let itemView = ItemView.init(frame: .zero)//.init(origin: .zero, size: size)
         self.addSubview(itemView)
         return itemView
      }
      itemViews.activateAnchorsAndSizes { views in /*All vertically centered, 48p height each*/
         let anchors = Constraint.distribute(vertically: views, align: .topLeft, spacing:12, offset:24)
         let sizes = views.map{Constraint.size($0, size: size)}
         return (anchors, sizes)
      }
//      Swift.print("itemViews:  \(itemViews)")
      return itemViews
   }
}
class ItemView:UIView{
   lazy var horizontalItems:[UIView] = createHorizontalItems()
   override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .green
      _ = horizontalItems
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   /**
    * Creates horizontal items
    */
   func createHorizontalItems() -> [UIView] {
      let size:CGSize = CGSize.init(width: 48, height: 48)
      let views:[UIView] = [UIColor.purple,.orange,.red,.blue].map{
         let view = UIView.init(frame: .zero)//.init(origin: .zero, size: size)
         self.addSubview(view)
         view.backgroundColor = $0
         return view
      }
      views.activateAnchorsAndSizes { views in
         let anchors = Constraint.distribute(horizontally: views, align: .centerLeft)
         let sizes = views.map{Constraint.size($0, size: size)}
         return (anchors, sizes)
      }
      return views
   }
}
