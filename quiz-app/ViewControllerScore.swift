//
//  ViewControllerScore.swift
//  quiz-app
//
//  Created by Nikita Fill on 4/9/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import UIKit
import Foundation

class ViewControllerScore: UIViewController {
    @IBOutlet weak var labelScore: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelScore.text = "You got \(QuizManager.sharedQuizManager.getScore()) correct answer(s)!"
    }
}