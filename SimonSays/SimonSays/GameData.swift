//
//  GameData.swift
//  SimonSays
//
//  Created by Peter Pohlmann on 26.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import UIKit

class GameData {

    let colors: [String] = ["Red", "Green", "Blue", "Yellow"]
    
    let colorMapDictionary = [
        "Red" : UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0),
        "Blue" : UIColor(red: 42.0/255.0, green: 167.0/255.0, blue: 240.0/255.0, alpha: 1.0),
        "Green" : UIColor(red: 46.0/255.0, green: 204.0/255.0, blue: 113.0/255.0, alpha: 1.0),
        "Yellow" : UIColor(red: 248.0/255.0, green: 148.0/255.0, blue: 6.0/255.0, alpha: 1.0)
    ]
    
    var sequenzArray = [String]()
    
    func randdomColor() -> UIColor{
    
        let randomColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        let randomColorString = colors[randomColorIndex]
        
        let randomUIColor = colorMapDictionary[randomColorString]
        
        sequenzArray.append(randomColorString)
        
        return randomUIColor!
        
    }

}
