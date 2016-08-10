//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
 draw a line or a circle on an image canvas
 */

let num = 127.23454667

round(num)



/* different printing function types */
enum FuncTypes: String {
    case Line
    case Circle
    case PrintBaseHeight
    case Default
}



final class ImageUtils{
    
    class func drawLineOnImage(funcType: FuncTypes) -> UIImage{
        
        //def vars
        let drawHeight = 200
        let drawWidth  = 200
        var rectangle =  CGRect(x: 0, y: 0, width: 0, height: 0)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: drawWidth, height: drawHeight), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        //flipp-coords
        CGContextTranslateCTM(context, 0, CGFloat(drawHeight));
        CGContextScaleCTM(context, 1.0, -1.0);
        
        //get height and color for line
        let LineHeight = Int(arc4random_uniform(200) )
        let LineColor = UIColor.cyanColor()
        var heightPercent = 0
        
        //context stuff
        CGContextSetLineWidth(context, 1)
        
        //switch some func cases for image height
        switch funcType {
            
        case .Circle:
            print("Recording")
            CGContextAddArc(context, 2.5, CGFloat(drawHeight/2), 2.5, 0, CGFloat(M_PI * 2), 0)
            CGContextSetFillColorWithColor(context,LineColor.CGColor)
            CGContextSetStrokeColorWithColor(context,LineColor.CGColor)
            CGContextDrawPath(context, .FillStroke)
            
        case .Line:
            print("image printingmarker")
            CGContextMoveToPoint(context,0, 0)
            heightPercent = LineHeight*55/100
            CGContextSetAlpha(context,0.4);
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
            rectangle = CGRect(x: 0, y: drawHeight/2, width: 4, height: Int(heightPercent))
            CGContextAddRect(context, rectangle)
            CGContextStrokePath(context)
            CGContextSetFillColorWithColor(context,LineColor.CGColor)
            CGContextFillRect(context, rectangle)
            
        default:
            break
        }
        
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
}


let lineOnImage = ImageUtils.drawLineOnImage(FuncTypes.Line)
let circleOnImahe = ImageUtils.drawLineOnImage(FuncTypes.Circle)




