//
//  SettingsViewController.swift
//  DrawingApp
//
//  Created by Peter Pohlmann on 30.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    weak var drawingVC: DrawingViewController? = nil
    
    @IBOutlet weak var brushLabel: UILabel!
    @IBOutlet weak var rainbowButton: UIButton!
    
    @IBOutlet weak var brushSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brushSlider.addTarget(self, action: #selector(SettingsViewController.sliderChanged), forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = false
        self.brushSlider.value = Float((drawingVC?.brushSize)!)
        self.brushLabel.text = "Brush Size: \((drawingVC?.brushSize)!)"
        
        checkRainboxButton()
    }
    
    
    func sliderChanged(){
        
        print("Slider changed")
        self.drawingVC?.brushSize = CGFloat(round(self.brushSlider.value))
        self.brushLabel.text = "Brush Size: \(round(self.brushSlider.value))"
    }
    
    
    @IBAction func shareArt(sender: AnyObject) {
        
        if let image = self.drawingVC?.imageView.image {
            
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func rainbowTapped(sender: AnyObject) {
        
        if(self.drawingVC?.rainbow==true) {
            
            self.drawingVC?.rainbow=false
            checkRainboxButton()
            
        } else{
            
            self.drawingVC?.rainbow=true
            checkRainboxButton()
        }
    }
    
    
    @IBAction func eraseTapped(sender: AnyObject) {
        
        self.drawingVC?.eraseDrawing()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func checkRainboxButton(){
        
        if(self.drawingVC?.rainbow==true) {
            self.rainbowButton.setTitle("Switch Rainbow off", forState: .Normal)
            
        } else{
            self.rainbowButton.setTitle("Switch Rainbow on", forState: .Normal)
        }
    }
    
    
}
