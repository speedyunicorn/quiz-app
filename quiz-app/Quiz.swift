//
//  Quiz.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/9/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation
import ObjectMapper

class Quiz: Mappable {
    var mode: QuizManager.Mode?
    var text: String?
    var answers: [Answer]?

    init(mode: QuizManager.Mode, question: String, answers: [Answer] ) {
        self.mode = mode
        self.text = question
        self.answers = answers
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        mode <- map["mode"]
        text <- map["text"]
        answers <- map["answers"]
        
    }
    
    func getMode() -> QuizManager.Mode {
        return self.mode!
    }
    
    func getText() -> String {
        return self.text!
    }
    
    func getAnswers() -> [Answer] {
        return self.answers!
    }
}