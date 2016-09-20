//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class PrintMedium {

    var name: String
    
    init(name:String) {
        self.name = name
    }
}



class Book: PrintMedium {

    var author: String
    
    init(author: String, name: String){
        self.author = author
        super.init(name: name)
    }
}

class Newspaper: PrintMedium {
    var publisher: String
    
    init(publisher: String, name: String){
        self.publisher = publisher
        super.init(name: name)
    }
}


var anyObject: [Any] = [1, 2, 3, "String Test", Book(author: "Book One", name: "Name 1"), (3,4.5,3), {(name: String) -> String in "Hello \(name)"}]


for item in anyObject {
    
    if let itemString = item as? String {
        print("is String \(item)")
    }
    
    if let itemString = item as? Book {
        print("is String \(itemString.author)")
    }
    
    if let IntType = item as? Int {
        print("Int \(IntType)")
    }
    
    
}

