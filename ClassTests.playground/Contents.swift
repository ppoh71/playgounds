//: Playground - noun: a place where people can play

import UIKit


struct AudioOutput {
    var level = 0
    var pan = 0
}

class AudioMode {

    var audioOutput = AudioOutput()
    var bpm = 120
    var sampleRate = 48000
    var name : String?
}


// struct is always a copied value type
let someOutput = AudioOutput()
let someMode = AudioMode()

someOutput.level
someMode.audioOutput.level = 1
someMode.audioOutput.level

let someOtherOutput = AudioOutput(level: 2, pan: 2)
let moreAudioOutput = AudioOutput(level: 2, pan: -1)

var leftChannel = moreAudioOutput

leftChannel.level = 5
leftChannel.level

moreAudioOutput.level



//class is always a reference type
let standardAudio = AudioMode()
standardAudio.audioOutput = AudioOutput(level: 2, pan: -1)
standardAudio.bpm = 130
standardAudio.sampleRate = 100000
standardAudio.name = "Standard"

let alsoStandardAudio = standardAudio

alsoStandardAudio.bpm = 150
standardAudio.bpm

standardAudio === alsoStandardAudio



//
// Struct / Stored Properties
//
struct NumberRanger {
    var firstNumber: Int
    let length: Int
}

var rangeOfNumber = NumberRanger(firstNumber: 4, length: 6)
rangeOfNumber.firstNumber = 5

var rangeOfNumbers = NumberRanger(firstNumber: 8, length: 17)
rangeOfNumbers.firstNumber = 3



//
// Lazy Properties
//

class ComplexClass {
    var propertyName = "SoemName"
}


class BasicClass {
    var basciArray = [String]()
    lazy var complexClass = ComplexClass()
}

let basic = BasicClass()
basic.basciArray.append("SomeString")

//now it will be initialized, not before
print("\(basic.complexClass.propertyName)")




//
// Computed Properties
//

struct Time {
    var seconds: Double {
    
        // Property Observer
        willSet(newSeconds){
            print("will set \(newSeconds)")
        }
        
        
        didSet{
            print("Did set seconds from \(oldValue)")
        }
        
    }
    
    var minutes: Double {
    
        // Property setter and getter
        get {
            return seconds / 60
        }
        
        set(myValue){
            seconds = myValue * 60
        }
    }

    var hours : Int {
        
        get{
            return Int(seconds / 3600 )
        }
        
        set(myHours){
             seconds = Double(myHours * 3600)
        }
    }
    
}


var time = Time(seconds: 3600)

time.minutes
time.hours

time.seconds = 160
time.seconds
time.minutes

time.minutes = 5
time.seconds

time.hours = 3
time.minutes
time.seconds





//
//  Type Properties , static
//

class SomeClass {

    static var storedTypeProperty = 18
    static var computedPropery: String{
        return "Hello, World"
    }
    
    class var computedTypePropertyTwo: String {
        return "This can be overidden"
    }
    
}

struct NumberPad {
    
    static var MaxInput = 9
    static var minInput = 0
    
    var currentInput: Int{
    
        didSet{
            if currentInput > NumberPad.MaxInput{
                currentInput = NumberPad.MaxInput
            } else if currentInput < NumberPad.minInput{
                currentInput = NumberPad.minInput
            }
        }
    
    }
}



var numberPad = NumberPad(currentInput: 3)
numberPad.currentInput

numberPad.currentInput = 20
numberPad.currentInput

















