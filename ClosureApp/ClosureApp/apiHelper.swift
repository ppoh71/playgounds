//
//  apiHelper.swift
//  ClosureApp
//
//  Created by Peter Pohlmann on 01.07.16.
//  Copyright © 2016 Peter Pohlmann. All rights reserved.
//

import Foundation

class apiHelper{
    
    func getTemp(tempClosure:(tempx:String, success: Bool) -> Void){
    
        let session = NSURLSession.sharedSession()
        
        let weatherURL = NSURL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        
        session.dataTaskWithURL(weatherURL!) { (data, response, error) in
            
            print("data: \(data)")
            print(response)
            
            
            if error == nil && data != nil {
                
                do {
                    print(0)
                    let weatherDict = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [String:AnyObject]
                    print("wearter: \(weatherDict)")
                    
                    if let query = weatherDict["query"] as? [String:AnyObject] {
                        print(1)
                        if let results = query["results"] as? [String:AnyObject] {
                            print(2)
                            if let channel = results["channel"] as? [String:AnyObject] {
                                print(3)
                                if let item = channel["item"] as? [String:AnyObject] {
                                    print("4")
                                    if let condition = item["condition"] as? [String:AnyObject] {
                                        print("5 \(condition["temp"])")
                                        if let temp = condition["temp"] as? String {
                                            print(6)
                                            print("temp is : \(temp)")
                                            tempClosure(tempx: "Temp is \(temp)", success: true)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                } catch{
                    tempClosure(tempx: "errrror", success: false)
                }
                
            } else{
                
                tempClosure(tempx: "errrror", success: false)
                
            }
            
            }.resume()
        

    }
    

}
