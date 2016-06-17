//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum Type {
    case Save
    case Resume
    case Cancel
    case Print
    
    init(){
        self = .Save
    }
}


class test {

    var type = Type()

    let textSave = "Save"
    let textResume = "Resume"
    let textPrint = "Print"
    
    
    init(){

    }

    func printText(){
    
        
        
        
    }
    


}

var test1 = test()
test1.type = .Resume

print(test1.type)

