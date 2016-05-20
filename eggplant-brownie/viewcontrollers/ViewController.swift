//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Wender Freese on 5/14/16.
//  Copyright (c) 2016 alura. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    var delegate:AddMealDelegate?
    
    var items = [
        Item(name: "Eggplant Brownie", calories: 10),
        Item(name: "Zuchini Muffim", calories: 10),
        Item(name: "Cookies", calories: 10),
        Item(name: "Coconut Oil", calories: 500),
        Item(name: "Chocolat Frosting", calories: 1000),
        Item(name: "Chocolat Chip", calories: 1000)
    ]

    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell == nil {
            return
        }
        
        if cell?.accessoryType == UITableViewCellAccessoryType.None {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            if let position = find(selected, items[indexPath.row]) {
                selected.removeAtIndex(position)
            }
        }
    }
    
    @IBAction
    func add() {
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text
        let happiness = happinessField!.text.toInt()
        
        if happiness == nil {
            return
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
        
        if delegate == nil {
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}

