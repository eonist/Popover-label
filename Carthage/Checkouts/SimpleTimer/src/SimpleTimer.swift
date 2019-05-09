import Foundation
/**
 * - Important: ⚠️️ @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * - Important: ⚠️️ because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 * ## Examples:
 * SimpleTimer(interval:3, repeats:true){print("tick")}.start()//ticks every 3 seconds
 */
public class SimpleTimer {
   private var timer: Timer?
   public var interval: TimeInterval /*in seconds*/
   public var repeats: Bool
   public var tick: Tick
   public init(interval: TimeInterval, repeats: Bool = false, onTick:@escaping Tick) {
      self.interval = interval
      self.repeats = repeats
      self.tick = onTick
   }
}
/**
 * Core
 */
extension SimpleTimer {
   /**
    * Starts the timer
    */
   public func start() {
      timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(update), userInfo: nil, repeats: true)
   }
   /**
    * Stops the timer
    */
   public func stop() {
      timer?.invalidate()
   }
   /**
    * Resets the timer
    */
   public func reset() {
      stop()
      start()
   }
   /**
    * This method must be in the public or scope
    */
   @objc internal func update() {
      tick()
   }
}
/**
 * Type
 */
extension SimpleTimer {
   /**
    * Callback type (Equivilent to onChange)
    */
   public typealias Tick = () -> Void
}
