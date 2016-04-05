//
//  ViewControllerQuestions.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/2/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import UIKit

class ViewControllerQuestions: UIViewController {
    
    
    @IBOutlet weak var labelMode: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonAnswer0: UIButton!
    @IBOutlet weak var buttonAnswer1: UIButton!
    @IBOutlet weak var buttonAnswer2: UIButton!
    
    var currentQuiz: Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let cMode = QuizManager.sharedQuizManager.getMode
        
        currentQuiz = QuizManager.sharedQuizManager.getQuiz()
        
        switch QuizManager.sharedQuizManager.getMode() {
            case .Easy:
                labelMode.text = "Easy Mode"
            case .Normal:
                labelMode.text = "Normal Mode"
            case .Hard:
                labelMode.text = "Hard Mode"
        }
        
        labelQuestion.text = currentQuiz?.getText()
        
        buttonAnswer0.setTitle(currentQuiz?.answers?[0].text, forState: UIControlState.Normal)
        buttonAnswer1.setTitle(currentQuiz?.answers?[1].text, forState: UIControlState.Normal)
        buttonAnswer2.setTitle(currentQuiz?.answers?[2].text, forState: UIControlState.Normal)
        
    }
    
    @IBAction func answerButtonTouched(sender: AnyObject) {
        // print(sender.identifier!)
        
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Check segue identifier and set label to correct value
        print ("segue.identifier = \(segue.identifier)")
        if segue.identifier == "modeEasy" {
            labelMode.text = "Easy Mode"
        }
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("unwindSegue.identifier = \(unwindSegue.identifier)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


