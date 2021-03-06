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
    @IBOutlet weak var buttonAnswer0: QuizUIButton!
    @IBOutlet weak var buttonAnswer1: QuizUIButton!
    @IBOutlet weak var buttonAnswer2: QuizUIButton!
    
    var currentQuiz: Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getNextQuizForCurrentMode()
    }
    
    @IBAction func answerButtonTouched(sender: AnyObject) {
        if let button = sender as? QuizUIButton{
            // Check if correct answer (button) touched and increase score
            if button.getIsCorrect() {
                // score = score + 1
                QuizManager.sharedQuizManager.increaseScore()
            }
        }
        getNextQuizForCurrentMode()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Check segue identifier and set label to correct value
        // print ("segue.identifier = \(segue.identifier)")
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func getNextQuizForCurrentMode() {
        if let currentQuiz = QuizManager.sharedQuizManager.getNextQuiz() as Quiz! {
            switch QuizManager.sharedQuizManager.getMode() {
                case .Easy:
                    labelMode.text = "Easy Mode"
                case .Normal:
                    labelMode.text = "Normal Mode"
                case .Hard:
                    labelMode.text = "Hard Mode"
            }
        
            labelQuestion.text = currentQuiz.getText()
        
            buttonAnswer0.setTitle(currentQuiz.answers?[0].text, forState: UIControlState.Normal)
            buttonAnswer0.setIsCorrect((currentQuiz.answers?[0].isCorrect)!)
        
            buttonAnswer1.setTitle(currentQuiz.answers?[1].text, forState: UIControlState.Normal)
            buttonAnswer1.setIsCorrect((currentQuiz.answers?[1].isCorrect)!)
        
            buttonAnswer2.setTitle(currentQuiz.answers?[2].text, forState: UIControlState.Normal)
            buttonAnswer2.setIsCorrect((currentQuiz.answers?[2].isCorrect)!)
        }
        else {
            // No question left, go to the final score
            self.performSegueWithIdentifier("toScore", sender: self)
            
        }
    }
   
   // let ViewControllerQuestions = UIView(frame: CGRectMake(0, 0, 640, 200))
    //ViewControllerQuestions.backgroundColor = UIColor(patternImage: UIImage(named: "myImage")!)
    
}


