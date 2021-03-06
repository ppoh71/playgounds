//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


public struct PixelData {
    var a:UInt8 = 255
    var r:UInt8
    var g:UInt8
    var b:UInt8
}

private let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
private let bitmapInfo:CGBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedFirst.rawValue)

public func imageFromARGB32Bitmap(pixels:[PixelData], width:UInt, height:UInt)->UIImage {
    let bitsPerComponent:UInt = 8
    let bitsPerPixel:UInt = 32
    
    assert(pixels.count == Int(width * height))
    
    var data = pixels // Copy to mutable []
    let providerRef = CGDataProviderCreateWithCFData(
        NSData(bytes: &data, length: data.count * sizeof(PixelData))
    )
    
    let cgim = CGImageCreate(
        width,
        height,
        bitsPerComponent,
        bitsPerPixel,
        width * UInt(sizeof(PixelData)),
        rgbColorSpace,
        bitmapInfo,
        providerRef,
        nil,
        true,
        
    )
    return UIImage(CGImage: cgim)
}