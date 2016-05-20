//
//  Item.swift
//  eggplant-brownie
//
//  Created by Wender Freese on 5/15/16.
//  Copyright (c) 2016 alura. All rights reserved.
//

import Foundation

class Item: Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

func ==(first: Item, second: Item) -> Bool {
    return first.name == second.name &&
        first.calories == second.calories
}