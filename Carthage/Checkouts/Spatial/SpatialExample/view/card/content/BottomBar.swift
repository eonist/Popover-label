import UIKit

class BottomBar :UIView{
   override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .blue
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension BottomBar{
   static let bottomBarHeight:CGFloat = UIScreen.main.bounds.width/4 + UIApplication.shared.statusBarFrame.height
}
