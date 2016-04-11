//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"


enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}


let ace = Rank.Four
let aceRawValue = ace.rawValue

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
       
        }
    }
    
    func color() -> String {
        
        switch self {
        case .Spades:
            return "black1"
        case .Hearts:
            return "white2"
        case .Diamonds:
            return "white3"
        case .Clubs:
            return "black4"
            
        }

    
    }

}


let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

let spades = Suit.Spades
let color = spades.color()


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()










