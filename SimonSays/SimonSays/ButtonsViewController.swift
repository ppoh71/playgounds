//
//  ButtonsViewController.swift
//  SimonSays
//
//  Created by Peter Pohlmann on 26.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController {
    
    @IBOutlet var colorButton: [ColorButton]!
    
    var gamneData: GameData!
    var index = 0
    var highscore = NSUserDefaults.standardUserDefaults().integerForKey("Highscore")
    
    
    var colors = [UIColor.redColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.greenColor()]
    
    override func viewDidLoad() {
        configureButtons()  
        
    }
    
    @IBAction func buttonHandler(sender: ColorButton){
    
        print("Button tapped: \(sender.tag)")
        if (sender.color == gamneData.sequenzArray[index]) {
            index += 1
            
            if (index>=gamneData.sequenzArray.count) {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
        } else{
            //game ogver
            if let vc = self.presentingViewController as?  ColorViewController {
            
                if (gamneData.sequenzArray.count - 1 > highscore) {
                
                    NSUserDefaults.standardUserDefaults().setInteger(gamneData.sequenzArray.count - 1, forKey: "Highscore")
                }
                
                vc.gameover = true
                dismissViewControllerAnimated(false, completion: nil)
            }
        }
    }
    
    
    func configureButtons(){
    
        for (index, button) in colorButton.enumerate() {
            button.color = gamneData.colors[index]
            button.backgroundColor = gamneData.colorMapDictionary[button.color!]
        }
    }
    
}
