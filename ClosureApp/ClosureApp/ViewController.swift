//
//  ViewController.swift
//  ClosureApp
//
//  Created by Peter Pohlmann on 01.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



    @IBAction func tempTapped(sender: AnyObject) {
        
        let helper = apiHelper()
        
        helper.getTemp { (tempx, success) in
            if success==true{
                dispatch_async(dispatch_get_main_queue(), { () -> Void  in
                     self.tempLabel.text = tempx
                })

            } else {
                dispatch_async(dispatch_get_main_queue(), { () -> Void  in
                    self.tempLabel.text = tempx
                })
 
            }
        }
        
        
    }
}

