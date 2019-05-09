import UIKit
import SimpleTimerLib

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = UIView()
      var idx: Int = 0
      let tick: () -> Void = {
         Swift.print("tick: idx\(idx)")
         idx += 1
      }
      let simpleTimer: SimpleTimer = .init(interval: 0.08, repeats: true, onTick: tick)
      simpleTimer.start()
   }
}
