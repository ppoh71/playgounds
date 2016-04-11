// Playground - noun: a place where people can play

import UIKit


func drawLineOnImage() -> UIImage{
    
    let drawHeight = 100
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 10, height: drawHeight), false, 0)
    let context = UIGraphicsGetCurrentContext()
    
    //flipp-coords
    CGContextTranslateCTM(context, 0, CGFloat(drawHeight));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    // awesome drawing code
    //let height = globalLineAltitude.gLineAltitude
    let height = rand()%100
    let rectangle = CGRect(x: 0, y: 0, width: 1, height: Int(height))
    
    CGContextMoveToPoint(context,0, 0)
    CGContextAddRect(context, rectangle)
    
    //
    //CGContextAddLineToPoint(context, 5, CGFloat(height))
    print("height \(height)")
    
    CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
    CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
    CGContextSetLineWidth(context, 3)
    CGContextSetAlpha(context,0.6);
    CGContextDrawPath(context, .FillStroke)


    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return img
    
}


var image = drawLineOnImage()
var image2 = drawLineOnImage()
var image3 = drawLineOnImage()





