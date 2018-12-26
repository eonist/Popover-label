import UIKit
import With
import Spatial

/**
 * Create
 */
extension PopoverTag{
   /**
    * Creates text label
    */
   func createTextLabel() -> UILabel{
      return with(.init()) {
         $0.text = "+1 Like"
         $0.font = .systemFont(ofSize: 32)
         $0.textColor = .white
         $0.textAlignment = .center
//         $0.backgroundColor = .orange/*debug*/
         addSubview($0)
         $0.activateAnchorAndSize { view in
            let a = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter,offset:.init(x:0,y:arrowHeight))
            let s = Constraint.size(view, to:self)
            return (a,s)
         }
      }
   }
   /**
    * Creates the background layer
    */
   func createBackgroundLayer() -> CAShapeLayer{
      let shapeLayer = createArrowBox(rect: self.bounds, arrowHeight: arrowHeight, radius:20)
      self.layer.addSublayer(shapeLayer)
      return shapeLayer
   }
   /**
    * Creates the Arrow box graphics
    */
   private func createArrowBox(rect:CGRect, arrowHeight:CGFloat, radius:CGFloat) -> CAShapeLayer{
      //for height you need to get the adjecentLength
      let rect:CGRect = CGRect.init(origin:.init(x:rect.origin.x,y:rect.origin.y+arrowHeight),size:rect.size)
      let adjacentSide = TriangleMath.adjacent(opposite: arrowHeight)
      //      let hypotenuseSide = adjacentSide * 2
      //      let polarPT = TriangleMath.polar(hypotenuseSide, ㎭ * 60)
      let p1 = CGPoint.init(x:rect.origin.x,y:rect.origin.y)
      let a = CGPoint.init(x: p1.x+(rect.width/2)-adjacentSide, y: rect.origin.y )
      let b = CGPoint.init(x: p1.x+(rect.width/2), y: rect.origin.y-arrowHeight)
      let c = CGPoint.init(x: p1.x+(rect.width/2)+adjacentSide, y: rect.origin.y)
      let p2 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y)
      let p3 = CGPoint.init(x:rect.origin.x+rect.width, y:rect.origin.y+rect.height)
      let p4 = CGPoint.init(x:rect.origin.x, y:rect.origin.y+rect.height)
      //      let points:[CGPoint] = [p1,a,b,c,p2,p3,p4]
      //      var cgPath = CGPathParser.polyLine(points:points, close: true)
      let cgPath:CGPath = {
         let path:CGMutablePath = CGMutablePath()
         
         path.move(to: p4)
         path.addArc(tangent1End: p1, tangent2End: p2, radius: radius)
         path.addLine(to: a)
         path.addLine(to: b)
         path.addLine(to: c)
         path.addArc(tangent1End: p2, tangent2End: p3, radius: radius)
         //         path.addLine(to: p2)
         //         path.addLine(to: p3)
         path.addArc(tangent1End: p3, tangent2End: p4, radius: radius)
         //         path.addLine(to: p4)
         path.addArc(tangent1End: p4, tangent2End: p1, radius: radius)
         path.closeSubpath()
         return path
      }()
      
      //      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.maxY), radius: radius)//Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.maxX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.maxY), radius: radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.maxY), tangent2End: CGPoint(x:rect.minX, y:rect.minY), radius: radius)
      //      path.addArc(tangent1End: CGPoint(x:rect.minX, y:rect.minY), tangent2End: CGPoint(x:rect.maxX, y:rect.minY), radius: radius)
      
      
      
      //      let offset:CGPoint = .init(x:-rect.width/2,y:-(rect.height+arrowHeight)/2)
      //      CGPathModifier.translate(path: &cgPath, p: offset)
      //      CGPathModifier.rotate(path:&cgPath,angle:-CGFloat.pi/2.0)//45deg
      //      let reOffset:CGPoint = .init(x:rect.width/2,y:(rect.height+arrowHeight)/2)
      //      CGPathModifier.translate(path: &cgPath, p: reOffset)
      /**/
      let shapeLayer:CAShapeLayer = .init()
      
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: style.color)
      return shapeLayer
   }
}
