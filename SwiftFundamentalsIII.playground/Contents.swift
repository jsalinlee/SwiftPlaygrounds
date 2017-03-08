//: Playground - noun: a place where people can play

import UIKit

var temp = 0, first = 0, second = 0, answerIndex = 0
var intArray = [Int]()
for i in 1...255{
    intArray.append(i)
}

for i in 1...100{
    first = intArray[Int(arc4random_uniform(254))]
    second = intArray[Int(arc4random_uniform(254))]
    
    temp = intArray[first]
    intArray[first] = intArray[second]
    intArray[second] = temp
}

for i in 0..<intArray.count{
    if intArray[i] == 42{
        answerIndex = i
        intArray.remove(at: i)
        print ("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index " + String(answerIndex))
        break
    }
}