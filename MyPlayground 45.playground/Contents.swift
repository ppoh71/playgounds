//: Playground - noun: a place where people can play

import UIKit

enum ShopError: ErrorType {
    case ItemNotFound
    case NotEnoughMoney(missing: Int)
    case NotAvailable
}

struct Item {
    let price: Int
    var amount: Int
}

class Shop {
    
    var items = [
        "Sword": Item(price: 5, amount: 10),
        "Shield": Item(price: 10, amount: 5),
        "Potion": Item(price: 20, amount: 3)
    ]
    
    var money = 0
    
    func sellItem(item: String) {
        print("Sold \(item)")
    }
    
    func sell(name: String) throws {
        
        guard let item = items[name] else {
            throw ShopError.ItemNotFound
        }
        
        guard item.amount > 0 else {
            throw ShopError.NotAvailable
        }
        
        guard item.price <= money else {
            throw ShopError.NotEnoughMoney(missing: item.price - money)
        }
        
        money -= item.price
        
        var updatedItem = item
        updatedItem.amount--
        items[name] = updatedItem
        
        sellItem(name)
        
    }
    
}

var shop = Shop()
shop.money = 6

func buyItem() throws {
    let item = "Sword"
    
    try shop.sell(item)
}

do {
    try buyItem()
} catch ShopError.NotEnoughMoney(let moneyNeeded) {
    print("\(moneyNeeded) more coins needed")
} catch ShopError.NotAvailable {
    print("Item is not available")
} catch ShopError.ItemNotFound {
    print("Item was not found")
} catch {
    print("There was an unknown error")
}





















