import UIKit
import Spatial

extension CardView{
   static let margin:UIEdgeInsets = .init(top: 24, left: 12, bottom: 24, right: 12)
   /**
    * Creates bg layer
    */
   func createBackgroundLayer() -> CALayer{
      let bgLayer: CALayer = {
         let layer = CALayer()
         layer.backgroundColor = UIColor.green.cgColor
         layer.frame = self.frame//CGRect.init(x: CardView.margin.left, y: CardView.margin.top, width: self.frame.width - (CardView.margin.left + CardView.margin.right)  , height: self.frame.height - (CardView.margin.top + CardView.margin.bottom))
         //         layer.cornerRadius = 24
         return layer
      }()
      self.layer.addSublayer(bgLayer)
      return bgLayer
   }
   /**
    * Creates and applies mask to view
    */
   func createMaskLayer() -> CAShapeLayer{
      let maskLayer = CAShapeLayer()
      let insetFrame:CGRect = CGRect.init(x: CardView.margin.left, y: CardView.margin.top, width: self.frame.width - (CardView.margin.left + CardView.margin.right)  , height: self.frame.height - (CardView.margin.top + CardView.margin.bottom))
      let path = UIBezierPath.init(roundedRect: insetFrame, cornerRadius: 24)
      maskLayer.path = path.cgPath
      self.layer.mask = maskLayer//applies the mask to the view
      return maskLayer
   }
   /**
    * Creates topBar
    */
   func createTopBar() -> TopBar{
      let topBar:TopBar = .init(frame: .zero)
      self.addSubview(topBar)
      topBar.activateAnchorAndSize { view in
         let a = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft, offset:CGPoint(x:CardView.margin.left,y:CardView.margin.top))
         let s = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: TopBar.topBarHeight))
         return (a,s)
      }
      return topBar
   }
   /**
    * Creates the middle card content view
    */
   func createMiddleContent() -> MiddleContent{
      let size:CGSize = {
         let w:CGFloat = self.frame.width - (CardView.margin.left+CardView.margin.right)
         let h:CGFloat = self.frame.height - (TopBar.topBarHeight + BottomBar.bottomBarHeight + CardView.margin.top + CardView.margin.bottom)
         return CGSize.init(width: w, height: h)
      }()
      let cardContent = MiddleContent.init(frame: CGRect.init(origin: .zero, size: size))
      self.addSubview(cardContent)
      cardContent.activateAnchorAndSize { view in
         let a = Constraint.anchor(view, to: topBar, align: .topLeft, alignTo: .bottomLeft, offset:.zero)
         let s = Constraint.size(view, size: size)
         return (a,s)
      }
      return cardContent
   }
   /**
    * Creates bottomBar
    */
   func createBottomBar() -> BottomBar {
      let bottomBar:BottomBar = .init(frame: .zero)
      self.addSubview(bottomBar)
      bottomBar.activateAnchorAndSize { view in
         let a = Constraint.anchor(view, to: cardContent, align: .topLeft, alignTo: .bottomLeft, offset:.zero)
         let s = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: BottomBar.bottomBarHeight))
         return (a,s)
      }
      return bottomBar
   }
}
