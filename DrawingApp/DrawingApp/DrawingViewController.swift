//
//  ViewController.swift
//  DrawingApp
//
//  Created by Peter Pohlmann on 30.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    
    var moveCnt = 0
    
    @IBOutlet weak var StackviewButtons: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushSize: CGFloat = 15.0
    
    var rainbow:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DrawingViewController.appActive), name: UIApplicationDidBecomeActiveNotification, object: nil)
        tappedBlue(UIButton())
        
    }
    
    
    func appActive(){
        
        self.StackviewButtons.hidden = false
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch begin")
        
        if let touch = touches.first {
            let point = touch.locationInView(self.inputView)
            self.lastPoint = point
            print(point)
        }
        
        
        self.StackviewButtons.hidden = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch moved \(red)")
        
        if let touch = touches.first {
            let point = touch.locationInView(self.inputView)
            
            print(point)
            
            if rainbow==true{
                randomTapped(UIButton())
            }
            
            drawPoints(point, secondPoint: lastPoint)
            self.lastPoint = point
        }
        
        moveCnt += 1
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch ended")
        self.StackviewButtons.hidden = false
        
        if let touch = touches.first {
            let point = touch.locationInView(self.inputView)
            
            print(point)
            
            drawPoints(point, secondPoint: lastPoint)
            
        }
        
        
        
    }
    
    func drawPoints(firstPoint:CGPoint, secondPoint: CGPoint) {
        
        
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.imageView.image?.drawInRect(CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
        CGContextAddLineToPoint(context, firstPoint.x, firstPoint.y )
        CGContextSetLineWidth(context, brushSize)
        CGContextSetLineCap(context, .Round)
        
        CGContextSetRGBStrokeColor(context, self.red , self.green, self.blue, 1.0 )
        
        CGContextStrokePath(context)
        
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
       
        
    }
    
    
    
    func eraseDrawing(){
        
        self.imageView.image = nil
        
    }
    
    @IBAction func tappedBlue(sender: AnyObject) {
        red = 56.0/255
        green = 109.0/255
        blue = 229.0/255
    }
    
    @IBAction func greenTapped(sender: AnyObject) {
        red = 37.0/255
        green = 235.0/255
        blue = 114.0/255
    }
    
    @IBAction func redTapped(sender: AnyObject) {
        red = 229.0/255
        green = 56.0/255
        blue = 56.0/255
    }
    
    @IBAction func yellowTapped(sender: AnyObject) {
        red = 249/255
        green = 215.0/255
        blue = 23.0/255
    }
    
    @IBAction func randomTapped(sender: AnyObject) {
        
        red = CGFloat(random() % 255) / 255
        green = CGFloat(random() % 255) / 255
        blue = CGFloat(random() % 255) / 255
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "drawingToSettingsSegue" {
            
            let settingsVC = segue.destinationViewController as! SettingsViewController
            settingsVC.drawingVC = self
            
        }
        
        
    }
    
}

