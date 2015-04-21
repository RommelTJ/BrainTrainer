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
        if let type = context as? String {
            startQuiz(type)
        } else {
            pushControllerWithName("InterfaceController", context: nil)
        }
    }
    
    func startQuiz(type:String) {
        timer.setDate(NSDate(timeIntervalSinceNow: 30))
        var countdown = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("quizComplete"), userInfo: nil, repeats: false)
        timer.start()
        if type == "plus" {
            
        } else if type == "minus" {
            
        } else if type == "multiply" {
            
        } else if type == "divide" {
            
        }
    }
    
    func quizComplete() {
        println("Done!")
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
