//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Wender on 5/26/16.
//  Copyright © 2016 alura. All rights reserved.
//

import Foundation

class Dao {
    let mealsArchive: String
    let itemsArchive: String
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true
        )
        let dir = userDirs[0] as String
        
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func saveMeals(meals: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func saveItems(items: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as! Array
        }
        return Array<Meal>()
    }
    
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as! Array
        }
        return Array<Item>()
    }
}