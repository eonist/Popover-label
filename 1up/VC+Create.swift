import UIKit
import With

//l,r,t,b
//Make room for drawing arrow
//rotate cgPath

extension ViewController{
   /**
    * Creates CustomShapedShadowView instance
    */
   func createCustomShapedShadowView() -> CustomShapedShadowView{
      let customView = CustomShapedShadowView(frame:.init(origin:.zero,size:.init(width:200,height:200)))
      let roundCorners:UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
      customView.setAttributes(roundCorners, radius: 10)
      self.view.addSubview(customView)
      return customView
   }
   /**
    *
    */
   func createCustomShape(){
      let points:[CGPoint] = [.init(x: 0, y: 0),.init(x: 100, y: 0),.init(x: 100, y: 100),.init(x: 00, y: 100)]
      let cgPath = CGPathParser.polyLine(points:points, close: true, offset: .init(x: 0, y: 0))
      /**/
      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
      self.view.layer.addSublayer(shapeLayer)
   }
   /**
    *
    */
   func createRoundedRect(){
      let cgPath = CGRectParser.roundRect(rect:.init(origin: .zero, size: .init(width:100,height:100)), radius: 20)
      /**/
      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
      self.view.layer.addSublayer(shapeLayer)
   }
   /**
    *
    */
   func createTriangleShape(){
      let rect:CGRect = .init(origin:.zero,size:.init(width:50,height:50))
      let p1:CGPoint = .init(x:rect.width/2,y:0)
      let p2:CGPoint = .init(x:rect.width,y:rect.height)
      let p3:CGPoint = .init(x:0,y:rect.height)
      let points:[CGPoint] = [p1,p2,p3]//[.init(x: 0, y: 0),.init(x: 100, y: 0),.init(x: 100, y: 100),.init(x: 00, y: 100)]
      let cgPath = CGPathParser.polyLine(points:points, close: true)
      /**/
      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
      self.view.layer.addSublayer(shapeLayer)
   }
   /**
    *
    */
   func createEquilateralTriangle(){
      let triangle = TriangleMath.equilateralTriangle(height: 100)
      let points:[CGPoint] = [triangle.a,triangle.b,triangle.c]
      let cgPath = CGPathParser.polyLine(points:points, close: true)
      /**/
      let shapeLayer:CAShapeLayer = .init()
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
      self.view.layer.addSublayer(shapeLayer)
      
   }
   
   /**
    *
    */
   func createArrowBox(rect:CGRect,arrowHeight:CGFloat,radius:CGFloat) -> CAShapeLayer{
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
      CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
      return shapeLayer
   }
}

