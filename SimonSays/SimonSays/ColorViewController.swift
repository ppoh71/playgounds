//
//  ColorViewController.swift
//  SimonSays
//
//  Created by Peter Pohlmann on 26.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit


class ColorViewController: UIViewController{

    
    var gameData: GameData!
    var index = 0
    var timer = NSTimer()
    var gameover: Bool?
    let switchColor = UIColor(red: 218.0/255.0, green: 223.0/255.0, blue: 225.0/255.0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if (gameover != nil) {
            dismissViewControllerAnimated(false, completion: nil)
            return
        }
        
        
        if gameData.sequenzArray.isEmpty {
            changeToRandomColor()
        } else{
            index += 1
            if index < gameData.sequenzArray.count {
                timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ColorViewController.displayNextColor), userInfo: nil, repeats: false)
            } else{
                timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ColorViewController.changeToRandomColor), userInfo: nil, repeats: false)
            }
        }
    }

    
    func changeToRandomColor(){
        timer.invalidate()
        
        UIView.animateWithDuration(0.25, animations: {
            self.view.backgroundColor = self.switchColor
            self.view.backgroundColor = self.gameData.randdomColor()
        })
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ColorViewController.returnToButtons), userInfo: nil, repeats: false)
    }
    
    func displayNextColor(){
        timer.invalidate()
        
        UIView.animateWithDuration(0.25, animations: {
            self.view.backgroundColor = self.switchColor
            self.view.backgroundColor = self.gameData.colorMapDictionary[self.gameData.sequenzArray[self.index]]
        })
        
        index += 1
        
        if index < gameData.sequenzArray.count {
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ColorViewController.displayNextColor), userInfo: nil, repeats: false)
        } else{
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ColorViewController.changeToRandomColor), userInfo: nil, repeats: false)
        }
    }
    
    func returnToButtons(){
        timer.invalidate()
        index = 0
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("ButtonViewController") as? ButtonsViewController {
        
            vc.gamneData = gameData
            presentViewController(vc, animated: true, completion: nil)
        }
        
        view.backgroundColor = gameData.colorMapDictionary[gameData.sequenzArray[index]]
    }
    
}
