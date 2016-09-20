//: Playground - noun: a place where people can play

import UIKit




indirect enum artihExpression {

    case Number(Int)
    
    case Addition(artihExpression, artihExpression)
    
    case Division(artihExpression, artihExpression)

}

func evaluate(expression: artihExpression) -> Int {
    
    
    switch expression{
    
    
    case .Number(let number):
            return number
        
    case .Addition(let value1, let value2):
        return evaluate(value1) + evaluate(value2)
    
    case .Division(let value1, let value2):
        return evaluate(value1) / evaluate(value2)
        
    
    }
    
    
}

//var result = evaluate(.Addition(.Number(10), .Number(2))) / evaluate((.Number(4)))

var result2 = evaluate(.Division(.Addition(.Number(30), .Number(2)), .Number(4)))
