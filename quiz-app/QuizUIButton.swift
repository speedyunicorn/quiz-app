//
//  QuizUIButton.swift
//  quiz-app
//
//  Created by Nikita Fill on 4/8/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class QuizUIButton: UIButton {
    private var isCorrect = false
    
    func setIsCorrect(isC: Bool) {
        self.isCorrect = isC
    }
    
    func getIsCorrect() -> Bool {
        return self.isCorrect
    }
    
}