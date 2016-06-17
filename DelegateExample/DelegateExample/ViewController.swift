//
//  ViewController.swift
//  DelegateExample
//
//  Created by Peter Pohlmann on 08.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
        
            let secondVC:secondView = segue.destinationViewController as! secondView
            secondVC.delegate = self
        }
    }
    
}

extension ViewController: DataEnteredDelegate{


    func userInfo(info: String) {
        
        label.text = info
        
    }


}

