//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


protocol Speaker {
    func Speak()
}




class Vicki: Speaker {
    func Speak() {
        print("Hello, I am Vicki!")
    }
}

class Ray: Speaker {
    func Speak() {
        print("Yo, I am Ray!")
    }
}



class Animal {
}
class Dog : Animal, Speaker {
    func Speak() {
        print("Woof!")
    }
}

var speaker:Speaker

speaker = Ray()
speaker.Speak()

speaker = Vicki()
speaker.Speak()


class DateSimulator {
    
    let a:Speaker
    let b:Speaker
    var delegate: DateSimulatorDelegate?
    
    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
       
        if(delegate != nil){
            delegate?.dateSimulatorDidStart(self, a: a, b: b)
        }
        
        print("Off to dinner...")
        a.Speak()
        b.Speak()
        print("Walking back home...")
        if (delegate != nil) {
            delegate?.dateSimulatorDidEnd(self, a: a , b: b)
        }
    }
}

//protcol for delegate
protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b:Speaker)
}



class LoggingDateSimulator:DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        print("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b: Speaker)  {
        print("Date ended!")
    }
}


let sim = DateSimulator(a:Vicki(), b:Ray())
sim.delegate = LoggingDateSimulator()

sim.simulate()
