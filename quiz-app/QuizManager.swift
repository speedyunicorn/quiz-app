//
//  QuizManager.swift
//  quiz-app
//
//  Created by Nikita Fill on 3/9/16.
//  Copyright © 2016 Nikita Fill. All rights reserved.
//

import Foundation
import ObjectMapper

class QuizManager {
    private var quizArray: [Quiz]?
    private var score = 0
    
    enum Mode: String {
        case Easy = "easy"
        case Normal = "normal"
        case Hard = "hard"
    }
    
    private var currentMode: Mode = Mode.Easy

    static let sharedQuizManager = QuizManager()
    
    func setMode(mode: Mode) {
        self.currentMode = mode
        print("currentMode = \(currentMode)")
    }
    
    func getMode() -> Mode {
        return self.currentMode
    }
    
    func initQuizFromLocalJSONFile() {
        // print(NSBundle.mainBundle().bundlePath)
        
        if let filepath = NSBundle.mainBundle().pathForResource ("quiz.json", ofType: nil) {
            do {
            let content = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                // print(content)
                quizArray = Mapper<Quiz>().mapArray(content)
                
                // print(quizArray!.capacity)
                
            } catch {
                print("cannot read content")
            }
        } else {
            print("file not found")
        }
    }
    
    
    func getNextQuiz() -> Quiz? {
        var nextQuiz: Quiz?
        
        for index in 0...quizArray!.count - 1 {
            print(quizArray![index].getMode())
            if quizArray![index].getMode() == currentMode {
                nextQuiz = quizArray![index]
                quizArray!.removeAtIndex(index)
                break
            }
        }
        
        return nextQuiz
    }
    
    
    func getScore() -> Int {
        return self.score
    }
    
    func increaseScore() {
        self.score += 1
    }
    
    func initNewGame() {
        self.score = 0
        self.quizArray?.removeAll()
        initQuizFromLocalJSONFile()
    }
    
}