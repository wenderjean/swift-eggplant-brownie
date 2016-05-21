//
//  MealsTableViewController.swift
//  
//
//  Created by Wender Freese on 5/16/16.
//
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    var meals = [ Meal(name: "Eggplant brownie", happiness: 5),
        Meal(name: "Zucchini Muffin", happiness: 3)]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        print(cell.textLabel, terminator: "")
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
}
