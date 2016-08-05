//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class BinaryNumberGenerator: GeneratorType {


    var final: Int
    var count = 0
    
    init(end: Int){
        self.final = end
    }
    
    
    func next() -> Int?{
    
        guard count < final else{
            return nil
        }
    
        count += 1
        
        return Int(arc4random_uniform(100) % 2)
    }
}


let rand = BinaryNumberGenerator(end: 100)

//while rand.count < rand.final {
//    print("Nimary: \(rand.next()) ")
//}

while let x = rand.next() {
     print("Bimary: \(rand.next()) ")
}



class BinaryNumberSequence: SequenceType {
    
    
    var final: Int
    var count = 0
    
    init(end: Int){
        self.final = end
    }
    
    
    func generate() -> AnyGenerator<Int>{
        
        return AnyGenerator {
        
            guard self.count < self.final else{
                return nil
            }
        
            self.count += 1
        
            return Int(arc4random_uniform(100) % 2)
        }
    }
}

let random = BinaryNumberSequence(end: 100)

for y in random {
    print("squence: \(y)")
}






