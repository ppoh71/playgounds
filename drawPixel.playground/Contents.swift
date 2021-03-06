//: Playground - noun: a place where people can play

import UIKit

let LineHeight = random()%200
let LineColor = UIColor.cyanColor()
let LineAltitude  = random()%200



func drawLineOnImage() -> UIImage{
    

    
    let drawHeight = 200
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: drawHeight), false, 0)
    let context = UIGraphicsGetCurrentContext()
    
    //flipp-coords
    CGContextTranslateCTM(context, 0, CGFloat(drawHeight));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    //get height and color for line
    

    //percentage height of line image
    let percent = 35
    let heightPercent = LineHeight*percent/100
    let altitudePercent = LineAltitude*60/100
    
    //make rect with height, position midddle due to mapbox marker image settings
    let rectangle = CGRect(x: 0, y: drawHeight/2, width: 1, height: Int(heightPercent))
    
    
    let altrectangle = CGRect(x: 0, y: (drawHeight/2), width: 1, height: altitudePercent)
    
    //context stuff
    
    CGContextSetLineWidth(context, 1)
    CGContextMoveToPoint(context,0, 0)
    
    
    CGContextAddRect(context, rectangle)
    CGContextSetStrokeColorWithColor(context, LineColor.CGColor)
    CGContextDrawPath(context, .FillStroke)
    
    /*
     CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
     CGContextAddRect(context, altrectangle)
     CGContextDrawPath(context, .FillStroke)
     */
    
    
    CGContextSetAlpha(context,0.4);
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    
    //saveImageToFile(img, imageName: "Marker-Speed-\(Int(globalSpeed.gSpeed)).png")
    //print("draw image\(utils.getSpeed(globalSpeed.gSpeed)).png")
    
    return img
    
}




func drawCircleeOnImage() -> UIImage{
    
    
    let drawHeight = 200
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 5, height: drawHeight), false, 0)
    let context = UIGraphicsGetCurrentContext()
    
    //flipp-coords
    CGContextTranslateCTM(context, 0, CGFloat(drawHeight));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    //get height and color for line
    CGContextAddArc(context, 2.5, CGFloat(drawHeight/2), 2.5, 0, CGFloat(M_PI * 2), 0)
    CGContextSetFillColorWithColor(context,UIColor.whiteColor().CGColor)
    CGContextSetStrokeColorWithColor(context,UIColor.whiteColor().CGColor)
    CGContextDrawPath(context, .FillStroke)
    
    
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    
    //saveImageToFile(img, imageName: "Marker-Speed-\(Int(globalSpeed.gSpeed)).png")
    //print("draw image\(utils.getSpeed(globalSpeed.gSpeed)).png")
    
    return img
    
}





var startTime = CFAbsoluteTimeGetCurrent()

let img = drawLineOnImage()
let circle = drawCircleeOnImage()


let x = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0
