//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Interpolation
{
    class func interpolate<T>(from: T, to: T, progress: CGFloat) -> T
    {
        // Safety
        assert(progress >= 0 && progress <= 1, "Invalid progress value: \(progress)")
        
        if let a = from as? CGFloat, let b = to as? CGFloat
        {
        }
        if let a = from as? CGPoint, let b = to as? CGPoint
        {
            
        }
        if let from = from as? CGRect, let to = to as? CGRect
        {
            var returnRect = CGRect()
            returnRect.origin.x     = from.origin.x + (to.origin.x-from.origin.x) * progress
            returnRect.origin.y     = from.origin.y + (to.origin.y-from.origin.y) * progress
            returnRect.size.width   = from.size.width + (to.size.width-from.size.width) * progress
            returnRect.size.height  = from.size.height + (to.size.height-from.size.height) * progress
            return returnRect // Cannot convert return expression of type 'CGRect' to return type 'T'
        }
        
        return from
    }
}
