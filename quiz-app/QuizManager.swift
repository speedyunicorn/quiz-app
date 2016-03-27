//
//  QuizManager.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/9/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation

class QuizManager {
    
    enum Mode: Int {
        case Easy = 0
        case Normal = 1
        case Hard = 2
    }
    
    private var currentMode: Mode = Mode.Easy

    static let sharedQuizManager = QuizManager()
    
    func setMode(mode: Mode) {
        currentMode = mode
        print("currentMode = \(currentMode)")
    }
    
    func getMode() -> Mode {
        return currentMode
    }
    
}