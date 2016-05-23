//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Wender on 5/23/16.
//  Copyright © 2016 alura. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    let delegate: AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController",  bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.delegate = nil
        super.init(coder: aDecoder)
    }

    @IBAction
    func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField?.text
        let calories = NSString(string: (caloriesField?.text!)!).doubleValue
        
        let item = Item(name: name!, calories: calories)
        
        if delegate == nil {
            return
        }
        
        delegate!.addItem(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}
