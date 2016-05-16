//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Wender Freese on 5/14/16.
//  Copyright (c) 2016 alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField!
    @IBOutlet var happinessField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        println("eaten: \(name) \(happiness)!")
    }
}

