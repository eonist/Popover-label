import UIKit

class CGAffineTransformParser {
   /**
    * NOTE: You can chain scaleFromPoint and rotatAroundPoint and eventually skewFromPoint. This is a great way to get different transform results quickly
    * IMPORTANT: ⚠️️ You scale a view from the center. So if you want to scale from TopLeft, you have to calcualte the pivot from the centers POV. So: CGPoint(x:-width/2,y:-height/2)
    * EXAMPLE: tagView.transform = CGAffineTransformParser.scaleFromPoint(transform: tagView.transform, scale: .init(x:0.5,y:0.5), pivot: .init(x:0,y:-(100+arrowHeight)/2))
    */
   static func scaleFromPoint(transform:CGAffineTransform, scale:CGPoint, pivot:CGPoint) -> CGAffineTransform {
      var transform = transform
      transform = transform.translatedBy(x: pivot.x, y: pivot.y)/*<-this looks strange, but you sort of set the point here*/
      transform = transform.scaledBy(x: scale.x, y: scale.y)// = CGAffineTransformRotate(transform, rotation);
      transform = transform.translatedBy(x: -pivot.x, y: -pivot.y)/*then you reset the offset to the original position*/
      return transform
   }
}
/*Convenience extension*/
extension CGAffineTransform {
   mutating func scaleFromPoint(scale:CGPoint, pivot:CGPoint) {/*Convenience*/
      self = CGAffineTransformParser.scaleFromPoint(transform:self, scale:scale,pivot:pivot)
   }
}
