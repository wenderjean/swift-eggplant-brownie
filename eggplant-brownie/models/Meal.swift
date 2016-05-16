//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Wender Freese on 5/15/16.
//  Copyright (c) 2016 alura. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness:Int
    var items = Array<Item>();
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
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
}
