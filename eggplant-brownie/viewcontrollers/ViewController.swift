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

protocol AddAnItemDelegate {
    func addItem(item: Item)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!
    var delegate:AddMealDelegate?
    @IBOutlet var tableView: UITableView!
    
    var items = Array<Item>()
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New item",
                                            style: UIBarButtonItemStyle.Plain,
                                            target: self,
                                            action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
        items = Dao().loadItems()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
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
            if let position = selected.indexOf(items[indexPath.row]) {
                selected.removeAtIndex(position)
            }
        }
    }
    
    @IBAction
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show();
        }
    }
    
    @IBAction
    func add() {
        if let meal = getMealFromForm() {
            if delegate == nil {
                return
            }
            
            if let meals = delegate {
                meals.add(meal);
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show("Unexpected error, but the meal was added.");
                }
                return
            }
        }
        
        Alert(controller: self).show();
    }
    
    func addItem(item: Item) {
        items.append(item)
        Dao().saveItems(items)
        if let table = tableView {
            table.reloadData();
        } else {
            Alert(controller: self).show("Unexpected error, but the item was added.")
        }
    }
    
    func getMealFromForm() -> Meal? {
        if nameField == nil || happinessField == nil {
            return nil
        }
        
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil {
            return nil
        }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
        return meal
    }
}

