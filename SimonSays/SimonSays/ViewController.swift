//
//  ViewController.swift
//  SimonSays
//
//  Created by Peter Pohlmann on 26.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func viewDidAppear(animated: Bool) {
        highscoreLabel.text = "Highscore: " + String(NSUserDefaults.standardUserDefaults().integerForKey("Highscore"))
        
    }

    
    @IBAction func startGame(sender: AnyObject?) {
    
        let gameData = GameData()
        
        
        
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("ColorViewController") as? ColorViewController {
            print("vc")
            vc.gameData = gameData
            presentViewController(vc, animated: true, completion: nil)
         
        }
    }

   
}

