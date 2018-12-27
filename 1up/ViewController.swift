
import UIKit
/**
 * TODO: ⚠️️ Reach goal: smothed arrow corners
 * TODO: ⚠️️ more complex style, that has font color, size, margins etc
 * TODO: ⚠️️ add the minWidth 🚫, margins, parent sizes to child content size
 */

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
      
      createPopoverTag()
   }
}
