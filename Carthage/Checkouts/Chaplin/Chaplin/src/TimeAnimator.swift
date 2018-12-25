import UIKit
/**
 * let animator = TimeAnimator(duration:0.3,onChange:{/*animate stuff*/},onComplete:{/*anim completed*/})
 * animator.start()
 * EXAMPLE:
 *
 * let to = self.curX + 1
 * let animator = TimeAnimator(duration:0.3)
 * animator.tick = {
 *    Swift.print("animator.curCount:  \(animator.curCount)")
 *    Swift.print("animator.progress:  \(animator.progress)")
 *    self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
 *    self.frame.origin.x self.curX
 * }
 * animator.start()
 */
public class TimeAnimator:SimpleTimer{
   static let fps:TimeInterval = 1/60/*1/30 is 30FPS 1/60 IS 60FPS*/
   private var curCount:Int = 0
   private var totalCount:Int {return Int(ceil(duration / (interval)))}//rename to maxCount?, we needed to ceil, or else some cases would be zero
   public var duration:TimeInterval /*in seconds*/
   public var onComplete:() -> Void
   public init(duration:TimeInterval, onChange:@escaping () -> Void = {/*Swift.print("TimerAnimator.onChange")*/}, onComplete:@escaping () -> Void = {/*Swift.print("TimerAnimator.onComplete")*/}) {
      self.duration = duration
      self.onComplete = onComplete
      //      self.onChange = onChange
      super.init(interval: TimeAnimator.fps, repeats:true, onTick: onChange)
   }
   override func update() {
      if curCount >= totalCount {
         curCount = totalCount
         super.update()
         onComplete()
         stop()
      }else {
         super.update()
         curCount += 1
      }
   }
    /**
     * Stops timer and then sets curCount to 0
     */
   override public func reset() {
      stop()
      curCount = 0
   }
}
/**
 * Utilities
 */
extension TimeAnimator {
   /**
    * Returns (0 to 1)
    */
   public var progress:CGFloat {
      return CGFloat(curCount) / CGFloat(totalCount)
   }
   /**
    * Util method for interpolating between values
    */
   public static func interpolate(from:CGFloat, to:CGFloat, fraction:CGFloat) -> CGFloat{
      return fraction * (to - from) + from
   }
}
