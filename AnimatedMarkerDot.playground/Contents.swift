//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
container.backgroundColor = UIColor.white

XCPlaygroundPage.currentPage.liveView = container

//let square = UIView(frame: CGRectMake(50,50,100,100))
//square.backgroundColor = UIColor.redColor()
//container.addSubview(square)


func animation1() {
    
    /*
    let r = CAReplicatorLayer()
    r.bounds = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
    r.position = container.center
    r.backgroundColor = UIColor.lightGrayColor().CGColor
    container.layer.addSublayer(r)
    */
    
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 60,y: 60), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
    
    let circlePathOuter = UIBezierPath(arcCenter: CGPoint(x: 60,y: 60), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
    
    
    let shapeLayerOuter = CAShapeLayer()
    shapeLayerOuter.path = circlePathOuter.cgPath
    shapeLayerOuter.strokeColor = UIColor.green.cgColor
    shapeLayerOuter.fillColor = UIColor.clear.cgColor
    shapeLayerOuter.lineWidth = 0.5
    shapeLayerOuter.opacity = 1
    

    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.cgPath
    shapeLayer.fillColor = UIColor.blue.cgColor
    shapeLayer.strokeColor = UIColor.red.cgColor
    shapeLayer.lineWidth = 1.0
    shapeLayer.opacity = 0.7
    
    container.layer.addSublayer(shapeLayer)
    container.layer.addSublayer(shapeLayerOuter)
    
    
    let animationOuter = CABasicAnimation(keyPath: "opacity")
    animationOuter.fromValue = 0.2
    animationOuter.toValue = 0.8
    animationOuter.duration = 0.7
    animationOuter.autoreverses = true
    animationOuter.repeatCount = 200000
    
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 0.7
    animation.toValue = 0.3
    animation.duration = 0.7
    animation.autoreverses = true
    animation.repeatCount = 200000
    
    let animationLineWidth = CABasicAnimation(keyPath: "lineWidth")
    animationLineWidth.fromValue = 0
    animationLineWidth.toValue = 10
    animationLineWidth.duration = 0.7
    animationLineWidth.autoreverses = true
    animationLineWidth.repeatCount = 200000
    // Finally, add the animation to the layer
    
    
    shapeLayer.add(animation, forKey: "lineWidth")
    shapeLayer.add(animationLineWidth, forKey: "opacity")
    shapeLayer.add(animationOuter, forKey: "opacityOuter")

    
    /*
    let move = CABasicAnimation(keyPath: "position.y")
    move.toValue = bar.position.y - 35.0
    move.duration = 0.5
    move.autoreverses = true
    move.repeatCount = Float.infinity
    
    bar.addAnimation(move, forKey: nil)
    
    r.instanceCount = 1
    r.instanceDelay = 0.33
    r.masksToBounds = true
    r.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0)
    */
}


animation1()
