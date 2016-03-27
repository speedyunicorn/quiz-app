//
//  ViewControllerMain.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/2/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController {

//    @IBOutlet weak var ButtonEasyMode: UIButton!
//    @IBOutlet weak var ButtonNormalMode: UIButton!
//    @IBOutlet weak var ButtonHardMode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad - ViewControllerMain..")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print ("segue.identifier = \(segue.identifier)")
        
        switch segue.identifier! {
            case "modeEasy":
                QuizManager.sharedQuizManager.setMode(QuizManager.Mode.Easy)
            case "modeNormal":
                QuizManager.sharedQuizManager.setMode(QuizManager.Mode.Normal)
            case "modeHard":
                QuizManager.sharedQuizManager.setMode(QuizManager.Mode.Hard)
            default:
                QuizManager.sharedQuizManager.setMode(QuizManager.Mode.Easy)
        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

