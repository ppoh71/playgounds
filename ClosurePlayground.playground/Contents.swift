

let Bikes = ["Honda", "Triumph", "Norton", "Harley"]

typealias mathProb = (Int, Int) -> Int

func doMathFunction(mathClosure: mathProb) {

print("... \(mathClosure(5,18))")


}

doMathFunction { (int1, int2) -> Int in
    
    return int1 + int2

}