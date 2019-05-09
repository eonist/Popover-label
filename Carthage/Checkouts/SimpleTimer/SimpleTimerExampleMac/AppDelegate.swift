import Cocoa
import SimpleTimer_mac

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   func applicationDidFinishLaunching(_ aNotification: Notification) {
//      let tick:()->Void = {
//         Swift.print("tick: idx\(idx)")
//         idx += 1
//      }
//      let simpleTimer = SimpleTimer.init(interval: 0.08, repeats: true, onTick: tick)
//      simpleTimer.start()
      timerGCD()
   }
   var idx: Int = 0
   /**
    * For the time .seconds(Int), .microseconds(Int) and .nanoseconds(Int) may also be used.
    */
   func timerGCD() {
      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
//         if self.idx % 10 == 0 {}
         Swift.print("tick: idx\(self.idx)")
         self.idx += 1
         // Schedule the timer again
         self.timerGCD()
      }
//      dispatch_after( DispatchTime.now( dispatch_time_t(DispatchTime.now), Int64(1.0 * Double(NSEC_PER_SEC)) ), DispatchQueue.main) { [weak self] in
//         //            self?.doSomething()
//
//      }
   }
}
