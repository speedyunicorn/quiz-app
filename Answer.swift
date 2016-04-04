//
//  Answer.swift
//  quiz-app
//
//  Created by Nikita Fill on 4/2/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation
import ObjectMapper

class Answer: Mappable {
    var text: String?
    var isCorrect: Bool?
    
    init(text: String, isCorrect: Bool) {
        self.text = text
        self.isCorrect = isCorrect
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        text <- map["text"]
        isCorrect <- map["isCorrect"]
    }
    
}