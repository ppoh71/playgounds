//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,200,200))
container.backgroundColor = UIColor.whiteColor()


var subView = UIView()

subView.frame = CGRect(x:50 , y: 50, width:20, height: 20)
subView.backgroundColor = UIColor.blueColor()


//add Subviews
container.addSubview(subView)
print(subView.frame.width)



