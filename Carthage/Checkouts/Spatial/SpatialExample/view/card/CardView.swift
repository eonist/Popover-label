import UIKit

class CardView:UIView{
   lazy var backgroundLayer:CALayer = createBackgroundLayer()
   lazy var maskLayer:CAShapeLayer = createMaskLayer()
   lazy var topBar:TopBar = createTopBar()
   lazy var cardContent:MiddleContent = createMiddleContent()
   lazy var bottomBar:BottomBar = createBottomBar()
  
   
   override init(frame: CGRect) {
      Swift.print("CardView.init")
      super.init(frame: frame)
      self.backgroundColor = .gray
      _ = backgroundLayer
      _ = maskLayer
      _ = topBar
      _ = cardContent
      _ = bottomBar
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
