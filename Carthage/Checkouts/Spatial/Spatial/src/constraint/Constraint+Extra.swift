#if os(iOS)
import UIKit
/**
 * Extra utilities
 * TODO: ⚠️️ Consider deprecating and removeing these, as they are not that much used (Its more useful to know absolute refs to constraints)
 */
extension UIView {
   /**
    * Deactivates immediate constraints that target this view (self + superview)
    * TODO: ⚠️️ Consider removing this
    */
   public func deactivateImmediateConstraints(){
      NSLayoutConstraint.deactivate(self.immediateConstraints)
   }
   /**
    * Deactivates all constrains that target this view
    * TODO: ⚠️️ Consider removing this
    */
   public func deactiveAllConstraints(){
      NSLayoutConstraint.deactivate(self.allConstraints)
   }
   /**
    * Gets self.constraints + superview?.constraints for this particular view
    * NOTE: You can use immediateConstraints when you don't want to crawl entire hierarchies.
    * TODO: ⚠️️ Consider removing this
    */
   public var immediateConstraints:[NSLayoutConstraint]{
      let constraints = self.superview?.constraints.filter{
         $0.firstItem as? UIView === self /*|| $0.secondItem as? UIView === self*/ //<- this removes constraints that other views might have to this view
         } ?? []
      return self.constraints + constraints
   }
   /**
    * Crawls up superview hierarchy and gets all constraints that affect this view
    * TODO: ⚠️️ Consider removing this
    */
   public var allConstraints:[NSLayoutConstraint] {
      var view: UIView? = self
      var constraints:[NSLayoutConstraint] = []
      while let currentView = view {
         constraints += currentView.constraints.filter {
            return $0.firstItem as? UIView === self || $0.secondItem as? UIView === self //<- this removes constraints that other views might have to this view
         }
         view = view?.superview
      }
      return constraints
   }
   /**
    * Returns all constraints of kinds
    * EXAMPLE: NSLayoutConstraint.ofKind(rect.immediateConstraints, kinds: [.width,.height]) //width, height
    */
   public static func ofKind(_ constraints:[NSLayoutConstraint], kinds:[NSLayoutConstraint.Attribute]) -> [NSLayoutConstraint]{
      return kinds.map { kind in
         return constraints.filter { constraint in
            return constraint.firstAttribute == kind
         }
         }.flatMap({$0})//flattens 2d array to 1d array
   }
}
#endif
