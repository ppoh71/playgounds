//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,200,200))
container.backgroundColor = UIColor.whiteColor()


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
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.CGPath
    
    shapeLayer.fillColor = UIColor.blueColor().CGColor
    shapeLayer.strokeColor = UIColor.redColor().CGColor
    shapeLayer.lineWidth = 1.0
    
    container.layer.addSublayer(shapeLayer)
    shapeLayer.lineWidth = 20
    


    
    let animation = CABasicAnimation(keyPath: "lineWidth")
    
    // Set the starting value
    animation.fromValue = 0
    
    // Set the completion value
    animation.toValue = 10
    animation.duration = 0.7
    animation.autoreverses = true
    
    // How may times should the animation repeat?
    animation.repeatCount = 200000
    
    // Finally, add the animation to the layer
    shapeLayer.addAnimation(animation, forKey: "cornerRadius")

    
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
