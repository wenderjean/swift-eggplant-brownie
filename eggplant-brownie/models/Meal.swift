//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Wender Freese on 5/15/16.
//  Copyright (c) 2016 alura. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    let name:String
    let happiness:Int
    var items = Array<Item>();
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.items = aDecoder.decodeObjectForKey("items") as! Array<Item>
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.happiness, forKey: "happiness")
        aCoder.encodeObject(self.items, forKey: "items")
    }
    
    func add_item(item:Item) {
        items.append(item)
    }
    
    func total_of_calories() -> Double {
        var sum:Double  = 0;
        for item in items {
            sum += item.calories
        }
        return sum
    }
    
    func details() -> String {
        var message = "Happiness \(happiness)"
        for item in self.items {
            message += "\n * \(item.name) - calories \(item.calories)"
        }
        return message
    }
}
