//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



struct Stack<Element> {

    var items = [Element]()
    
    mutating func push(item:Element){
        items.append(item)
    
    }

    mutating func pop() -> Element{
    
        return items.removeLast()
    }
    
}


var stringStack = Stack<String>()
stringStack.push("Test")
stringStack.push("Test Two")
stringStack.push("String Three")

stringStack
stringStack.pop()


extension Stack {


    var lastItem: Element? {
    
        return items.isEmpty ? nil : items[items.count-1]
    
    }

}


stringStack.lastItem


/* next chapter */

protocol SomeProtocol{

}

class SomeClass {

}


func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U){

}


func findIndex<T>(array: [T], _ )




