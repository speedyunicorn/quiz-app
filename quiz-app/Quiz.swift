//
//  Quiz.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/9/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation

class Quiz {
    var questionText: String
    var answers: [String]
    
    init(question: String, answers: [String] ) {
        self.questionText = question
        self.answers = answers
    }
    
    func getQuestionText() -> String {
        return self.questionText
    }
    
    func getAnswers() -> [String] {
        return self.answers
    }
}