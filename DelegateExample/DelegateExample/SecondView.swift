//
//  SecondView.swift
//  DelegateExample
//
//  Created by Peter Pohlmann on 08.06.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate {
    
    func userInfo(info:String)
    
    
}

class secondView: UIViewController {


    @IBOutlet weak var textField: UITextField? = UITextField()
    @IBOutlet weak var sendButton: UIButton!
    
    var delegate:DataEnteredDelegate? = nil


    @IBAction func sendAction(sender: AnyObject) {
        
        if (delegate != nil){
            let information:NSString = textField!.text!
            delegate?.userInfo(information as String)
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
