//: Playground - noun: a place where people can play

import UIKit

class Animal{
    var name: String
    var health:  Int
    init(name: String){
        self.name = name
        self.health = 100
    }
    func displayHealth(){
        print(self.health)
    }
}

class Cat: Animal{
    var runHealthLost: Int
    override init(name: String){
        self.runHealthLost = 10
        super.init(name: name)
        self.health = 150
    }
    func growl(){
        print("Rawr!")
    }
    func run(){
        if self.health > runHealthLost{
            print("Running")
            self.health -= runHealthLost
        }
    }
}

class Cheetah: Cat{
    override init(name: String){
        super.init(name:name)
        self.runHealthLost = 50
    }
    override func run(){
        print("Running Fast")
        if self.health > runHealthLost{
            self.health -= runHealthLost
        }
    }
    func sleep(){
        self.health += 50
        if self.health > 200{
            self.health = 200
        }
    }
}

class Lion: Cat{
    override init(name: String){
        super.init(name: name)
        health = 200
    }
    override func growl(){
        print("ROAR!!!! I am the King of the Jungle")
    }
}

var chester = Cheetah(name: "Chester")
for i in 1...4{
    chester.run()
}
chester.displayHealth()

var samba = Lion(name: "Samba")
for i in 1...3{
    samba.run()
}
samba.growl()