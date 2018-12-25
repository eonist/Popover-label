import UIKit

class MainView:UIView {
   lazy var cardView:CardView = createCardView()
   override init(frame: CGRect) {
      super.init(frame: frame)
       _ = cardView
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
