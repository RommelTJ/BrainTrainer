//
//  SumsInterfaceController.swift
//  BrainTrainer
//
//  Created by Rommel Rico on 4/21/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import WatchKit
import Foundation


class SumsInterfaceController: WKInterfaceController {

    @IBOutlet weak var resultsLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var sumLabel: WKInterfaceLabel!
    
    @IBAction func answer1() {
        //TODO
    }
    
    @IBAction func answer2() {
        //TODO
    }
    
    @IBAction func answer3() {
        //TODO
    }
    
    @IBAction func answer4() {
        //TODO
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        println(context)
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
