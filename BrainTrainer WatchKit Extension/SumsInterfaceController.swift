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

    @IBOutlet weak var answerCorrectLabel: WKInterfaceLabel!
    @IBOutlet weak var resultsLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var sumLabel: WKInterfaceLabel!
    var firstOperand:Int = 0 //First operand
    var secondOperand:Int = 0 //Second operand
    var answer:Int = 0 //Answer
    var sumCharacter = "" //+,-,x, or ÷
    var correctAnswerIndex:Int = 0 //Which button gets the correct answer 1-4
    var answerButtons = ["answer1Label", "answer2Label", "answer3Label", "answer4Label"]
    var score:Int = 0
    var type:String = ""
    
    @IBOutlet weak var answer1Label: WKInterfaceButton!
    @IBAction func answer1() {
        answerPicked(1)
    }
    
    @IBOutlet weak var answer2Label: WKInterfaceButton!
    @IBAction func answer2() {
        answerPicked(2)
    }
    
    
    @IBOutlet weak var answer3Label: WKInterfaceButton!
    @IBAction func answer3() {
        answerPicked(3)
    }
    
    
    @IBOutlet weak var answer4Label: WKInterfaceButton!
    @IBAction func answer4() {
        answerPicked(4)
    }
    
    func answerPicked(chosenAnswer:Int) {
        if chosenAnswer == correctAnswerIndex {
            answerCorrectLabel.setText("Correct!")
            score++
        } else {
            answerCorrectLabel.setText("Wrong!")
        }
        generateQuestion()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let questionType = context as? String {
            type = questionType
            startQuiz()
        } else {
            pushControllerWithName("InterfaceController", context: nil)
        }
    }
    
    func startQuiz() {
        timer.setDate(NSDate(timeIntervalSinceNow: 30))
        var countdown = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("quizComplete"), userInfo: nil, repeats: false)
        timer.start()
        generateQuestion()
    }
    
    func quizComplete() {
        timer.setHidden(true)
        sumLabel.setHidden(true)
        answer1Label.setHidden(true)
        answer2Label.setHidden(true)
        answer3Label.setHidden(true)
        answer4Label.setHidden(true)
        answerCorrectLabel.setHidden(true)
        resultsLabel.setText("Your score: \(score)")
        resultsLabel.setHidden(false)
    }
    
    func generateQuestion() {
        if type == "plus" {
            firstOperand = Int(arc4random_uniform(11))
            secondOperand = Int(arc4random_uniform(11))
            answer = firstOperand + secondOperand
            sumCharacter = "+"
        } else if type == "minus" {
            firstOperand = Int(arc4random_uniform(41))
            secondOperand = Int(arc4random_uniform(21))
            answer = firstOperand - secondOperand
            sumCharacter = "-"
        } else if type == "multiply" {
            firstOperand = Int(arc4random_uniform(8))
            secondOperand = Int(arc4random_uniform(8))
            answer = firstOperand * secondOperand
            sumCharacter = "x"
        } else if type == "divide" {
            answer = Int(arc4random_uniform(21))
            secondOperand = Int(arc4random_uniform(21))
            firstOperand = answer * secondOperand
            if secondOperand == 0 {
                //Cannot divide by 0
                secondOperand = 1
            }
            answer = firstOperand / secondOperand
            sumCharacter = "÷"
        }
        correctAnswerIndex = Int(arc4random_uniform(4)) + 1
        for (index, value) in enumerate(answerButtons) {
            var buttonValue:Int
            if (index == correctAnswerIndex - 1) {
                buttonValue = answer
            } else {
                buttonValue = Int(arc4random_uniform(51))
                if buttonValue == answer {
                    buttonValue++
                }
            }
            if value == "answer1Label" {
                answer1Label.setTitle("\(buttonValue)")
            } else if value == "answer2Label" {
                answer2Label.setTitle("\(buttonValue)")
            } else if value == "answer3Label" {
                answer3Label.setTitle("\(buttonValue)")
            } else if value == "answer4Label" {
                answer4Label.setTitle("\(buttonValue)")
            }
        }
        sumLabel.setText("\(firstOperand) \(sumCharacter) \(secondOperand) =")
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
