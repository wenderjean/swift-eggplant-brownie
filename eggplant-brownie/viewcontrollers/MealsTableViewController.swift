//
//  MealsTableViewController.swift
//  
//
//  Created by Wender Freese on 5/16/16.
//
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    var meals = Array<Meal>()
    
    override func viewDidLoad() {
        meals = Dao().loadMeals()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        cell.addGestureRecognizer(longPress)
        
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
        Dao().saveMeals(meals)
        tableView.reloadData()
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            if indexPath == nil {
                return
            }
            
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal, handler: { action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
            })
        }
    }
}
