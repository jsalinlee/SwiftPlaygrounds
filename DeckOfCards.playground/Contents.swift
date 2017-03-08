//: Playground - noun: a place where people can play

import UIKit

struct Card{
    var value = ""
    var Suit = ""
    var numerical_value = 0
}

class Deck{
    var cards: [Card] = [Card]()
    
    var values: [String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    var suits: [String] = ["Clubs", "Spades", "Hearts", "Diamonds"]
    var numerical_values: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    
    init(){
        self.reset()
    }
    
    func dealTop() -> Card?{
        if cards.count < 1{
            return nil
        }
        let dealtCard = cards.remove(at: cards.count - 1)
        return dealtCard
    }
    
    func reset(){
        cards = []
        for suit in suits{
            for i in 0..<numerical_values.count{
                self.cards.append(Card(value: values[i], Suit: suit, numerical_value: numerical_values[i]))
            }
        }
    }
    
    func shuffle(){
        var first = 0
        var second = 0
        for _ in 0..<cards.count{
            first = Int(arc4random_uniform(UInt32(cards.count)))
            second = Int(arc4random_uniform(UInt32(cards.count)))
            let temp = cards[first]
            cards[first] = cards[second]
            cards[second] = temp
        }
    }
}

class Player{
    var name: String = String()
    var hand: [Card] = [Card]()
    
    func drawCard(deck: Deck) -> Card?{
        if let dealtCard = deck.dealTop(){
            hand.append(dealtCard)
            return hand[hand.count-1]
        }
        return nil
    }
    
    func discardCard(card: Card) -> Bool{
        
        if hand.count < 1{
            return false
        }
        for i in 0..<hand.count{
            if hand[i].value == card.value && hand[i].Suit == card.Suit{
                hand.remove(at: i)
                return true
            }
        }
        return false
    }
}
var testDeck = Deck()
var testCard = testDeck.cards[0]
var floople = Player()
testDeck.shuffle()
//print (testDeck.cards)
floople.drawCard(deck: testDeck)
floople.discardCard(card: testCard)
for i in 1...53{
    if let dealtCard = testDeck.dealTop(){
            print (dealtCard)
    }
}
