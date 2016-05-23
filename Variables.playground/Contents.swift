//: Playground - noun: a place where people can play

import UIKit

let drawHeight = 200
UIGraphicsBeginImageContextWithOptions(CGSize(width: 10, height: drawHeight), false, 0)
let context = UIGraphicsGetCurrentContext()

//flipp-coords
CGContextTranslateCTM(context, 0, CGFloat(drawHeight));
CGContextScaleCTM(context, 1.0, -1.0);

//get height and color for line
//let LineHeight = globalSpeed.gSpeed
//let LineColor = colorUtils.polylineColors(utils.getSpeedIndex(globalSpeed.gSpeed/3.6))
let LineHeight = 70
let LineColor = UIColor.cyanColor()

//percentage height of line image
let height2 = LineHeight*35/100

//make rect with height, position midddle due to mapbox marker image settings
let rectangle = CGRect(x: 0, y: drawHeight/2, width: 1, height: Int(height2))

let altrectangle = CGRect(x: 0, y: 180, width: 3, height: 3)

//context stuff
CGContextSetAlpha(context,0.6);
CGContextSetLineWidth(context, 1)
CGContextMoveToPoint(context,0, 0)

CGContextAddRect(context, rectangle)
CGContextSetStrokeColorWithColor(context, LineColor.CGColor)
CGContextDrawPath(context, .FillStroke)

CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
CGContextAddRect(context, altrectangle)
CGContextDrawPath(context, .FillStroke)

//CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)

//CGContextSetLineWidth(context, 1)

//CGContextDrawPath(context, .FillStroke)






let img = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

