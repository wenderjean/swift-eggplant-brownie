//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Wender on 5/24/16.
//  Copyright © 2016 alura. All rights reserved.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    func show(message: String = "Unexpected error.") {
        let details = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Understood", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(cancel)
        controller.presentViewController(details, animated: true, completion: nil)
    }
}
