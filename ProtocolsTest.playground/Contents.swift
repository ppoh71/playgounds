//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



/* Test lightswitch */

protocol Switchable {
    mutating func toggleSwitch()
}

enum LightSwitch: Switchable {
    
    case On, Off
    
    mutating func toggleSwitch() {
        switch self {
            
        case .On:
            self = .Off
            
        case .Off:
            self = .On
            
            
        }
    }
}


var lightSwitch = LightSwitch.On
lightSwitch.toggleSwitch()



/* test lotterie 1 */

protocol RandomGenerator {

    func random() -> Int
}


class LotterieGernerator: RandomGenerator{

    func random() -> Int {
        return Int(arc4random_uniform(UInt32(49) + 1))
    }

}


let Test = LotterieGernerator()

for _ in 0..<5 {

    print(Test.random())

}


/* test lotterie 2 */

class LotteryNumberGenerator{
    
    let numbers: Int
    let generator: RandomGenerator
    
    init(numbers:Int, generator: RandomGenerator){
        self.numbers = numbers
        self.generator = generator
    }

    func choose() -> [Int] {
    
        var numberArray = [Int]()
     
        while numberArray.count<numbers {
            
            let tempNumber = generator.random()
            
            if !numberArray.contains(tempNumber){
                numberArray.append(tempNumber)
            }
        }
    
        return numberArray
    }
}


let lotterieNumbers = LotteryNumberGenerator(numbers: 6, generator: LotterieGernerator())
let winningNumbers = lotterieNumbers.choose()



/* test lotterie  3 */

protocol Lottery {

    var lotteryGernerator: LotteryNumberGenerator { get }
    func play()
}


protocol LotterieDelegate{

    func numberMatch(number: Int)
    func numberDidNotMatch(number: Int)

}


class LotteryGame: Lottery {


    var winningNumbers = [5,1,23, 54, 12, 21]
    var lotteryGernerator = LotteryNumberGenerator(numbers: 6, generator: LotterieGernerator())
    var delegate: LotterieDelegate?
    
    func play() {
        
        var pickedNumbers = lotteryGernerator.choose()
        
        for number in pickedNumbers {
        
            if winningNumbers.contains(number){
                delegate?.numberMatch(number)
            } else{
                 delegate?.numberDidNotMatch(number)
            }
        
        }
    }

}

class LotteryGameTracker: LotterieDelegate{


    func numberMatch(number: Int) {
        print("\(number) is a winning number")
    }
    
    func numberDidNotMatch(number: Int) {
        print("\(number) did not match")
    }

}



var tracker = LotteryGameTracker()
var game = LotteryGame()
game.delegate = tracker

game.play()



/* lektopn 81 */

protocol Describable {
    var description: String { get }
}

extension LotteryNumberGenerator: Describable{

    var description: String{
        return "Just a String from Delegate"
    }
}


struct Dog {
    var description = "got 4 legs"
}

extension Dog: Describable{
}

let describedDog: Describable = Dog()

















