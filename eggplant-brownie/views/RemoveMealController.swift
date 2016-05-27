//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Wender on 5/25/16.
//  Copyright © 2016 alura. All rights reserved.
//

import UIKit

class RemoveMealController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(meal: Meal, handler: (UIAlertAction!) -> Void) {
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.Alert)
        let btnRemove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler)
        let btnCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(btnRemove)
        details.addAction(btnCancel)
        
        controller.presentViewController(details, animated: true, completion: nil)
    }
}
