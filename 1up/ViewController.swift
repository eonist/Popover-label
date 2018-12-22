
import UIKit

class ViewController: UIViewController {
   lazy var customView:CustomShapedShadowView = createCustomShapedShadowView()
   override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = .orange
      _ = customView
      
   }
}
