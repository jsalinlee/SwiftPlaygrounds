//: Playground - noun: a place where people can play

import UIKit

func tossCoin()->String{
    print("Tossing a Coin!")
    let result = arc4random_uniform(2)
    if result == 1{
        return "Heads"
    }
    else{
        return "Tails"
    }
}
print (tossCoin())

func tossMultipleCoins(n: Int) -> Double{
    var headsCount = 0.0
    for _ in 1...n{
        if tossCoin() == "Heads"{
            headsCount += 1
        }
    }
    return headsCount / Double(n)
}
print (tossMultipleCoins(n: 3))