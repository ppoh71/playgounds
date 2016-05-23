//: Playground - noun: a place where people can play

import UIKit

let list = [Int](1...5)
var arrayOfTuples = [(Int, Int)]()

for (index, element) in list.enumerate() {
    arrayOfTuples += [(index, element)]
    print(index)
    
}

print(arrayOfTuples)