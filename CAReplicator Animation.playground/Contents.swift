//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,200,200))
container.backgroundColor = UIColor.whiteColor()


XCPlaygroundPage.currentPage.liveView = container

//let square = UIView(frame: CGRectMake(50,50,100,100))
//square.backgroundColor = UIColor.redColor()
//
//container.addSubview(square)


func animation1() {
    
    let r = CAReplicatorLayer()
    r.bounds = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 200.0)
    r.position = container.center
    r.backgroundColor = UIColor.lightGrayColor().CGColor
    container.layer.addSublayer(r)
    
    
    let bar = CALayer()
    bar.bounds = CGRect(x: 0.0, y: 0.0, width: 8.0, height: 50.0)
    bar.position = CGPoint(x: 10.0, y: 100.0)
    bar.cornerRadius = 2.0
    bar.backgroundColor = UIColor.redColor().CGColor
    
    r.addSublayer(bar)
    
    let move = CABasicAnimation(keyPath: "position.y")
    move.toValue = bar.position.y - 35.0
    move.duration = 0.5
    move.autoreverses = true
    move.repeatCount = Float.infinity
    
    //bar.addAnimation(move, forKey: nil)
    
    r.instanceCount = 3
    r.instanceDelay = 0.33
    r.masksToBounds = true
    r.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0)
    
}




animation1()
