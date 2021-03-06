//
//  InterfaceController.swift
//  BrainTrainer WatchKit Extension
//
//  Created by Rommel Rico on 4/21/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBAction func plus() {
        segue("plus")
    }
    
    @IBAction func minus() {
        segue("minus")
    }
    
    @IBAction func multiply() {
        segue("multiply")
    }
    
    @IBAction func divide() {
        segue("divide")
    }
    
    func segue(type:String) {
        pushControllerWithName("SumsInterfaceController", context: type)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
