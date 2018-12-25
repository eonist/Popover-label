
import UIKit

class ViewController: UIViewController {
   lazy var customView:CustomShapedShadowView = createCustomShapedShadowView()
   override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = .white
//      _ = customView
//      createCustomShape()
//      createRoundedRect()
//      createTriangleShape()
//      let diagonalLength:CGFloat = TriangleMath.polarToLength(x:100,y:100)
//      Swift.print("diagonalLength:  \(diagonalLength)")//141.4213562373095
      
//      let adjacent = TriangleMath.adjacent(opposite: 100)
//      Swift.print("adjacent:  \(adjacent)")
//
//      let hypotenuse = adjacent * 2
//
//      Swift.print("hypotenuse:  \(hypotenuse)")
//
//      let polarPT = TriangleMath.polar(hypotenuse, ㎭ * 60)
//      Swift.print("polarPT.y:  \(polarPT.y)")
//      Swift.print("polarPT.x:  \(polarPT.x)")
//      let polarLength
//      createEquilateralTriangle()
      
      
      let arrowHeight:CGFloat = 20
      
      let rect:CGRect = {
         let size:CGSize = .init(width:200,height:100+arrowHeight)
         let position:CGPoint = .init(x:UIScreen.main.bounds.width/2-size.width/2, y:UIScreen.main.bounds.height/2-size.height/2)
         return .init(origin:position, size:size)
      }()
      let tagView:UIView = .init(frame:rect)
//      tagView.backgroundColor = .lightGray/*Debug*/
      self.view.addSubview(tagView)
      let shapeLayer = createArrowBox(rect: tagView.bounds, arrowHeight: arrowHeight, radius:20)
      tagView.layer.addSublayer(shapeLayer)
   }
}
