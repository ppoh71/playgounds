//: Playground - noun: a place where people can play

import UIKit
import Foundation



public struct Pixel {
    var r: UInt8
    var g: UInt8
    var b: UInt8
    var a: UInt8
    init(red: UInt8, green: UInt8, blue: UInt8) {
        r = red
        g = green
        b = blue
        a = 255
    }
}


// Update pixels

//var image = imageFromARGB32Bitmap(pixelData, width: 100, height: 200)
// image is a UIImage


public func makePixelSet(width: Int, height: Int) -> ([Pixel], Int, Int) {
    var pixel = Pixel(red: 255, green: 0, blue: 0)
    var pixels = [Pixel](count: 1, repeatedValue: pixel)
   
    /*
    for i in 0..<width {
        for j in 0..<height {
            pixel = Pixel(red: 0, green: UInt8(Double(i * 255 / width)), blue: UInt8(Double(j * 255 / height)))
           // pixels[i + j * width] = pixel
        }
    }*/
 
    return (pixels, width, height)
}

public func imageFromPixels(pixels: ([Pixel], width: Int, height: Int)) -> CIImage {
    let bitsPerComponent = 8
    let bitsPerPixel = 32
    let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue) // alpha is last
    
    let providerRef = CGDataProviderCreateWithCFData(NSData(bytes: pixels.0, length: pixels.0.count * sizeof(Pixel)))
    let image = CGImageCreate(pixels.1, pixels.2, bitsPerComponent, bitsPerPixel, pixels.1 * sizeof(Pixel), rgbColorSpace, bitmapInfo, providerRef, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
    return CIImage(CGImage: image!)
}

var width = 1
var height = 100
var pixelSet = makePixelSet(width, height: height)

let startTime : CFAbsoluteTime = CFAbsoluteTimeGetCurrent();

var image = imageFromPixels(pixelSet)

let x = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0
