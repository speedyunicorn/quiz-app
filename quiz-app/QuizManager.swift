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
    var quizArray: [Quiz]?
    
    
    enum Mode: String {
        case Easy = "easy"
        case Normal = "normal"
        case Hard = "hard"
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
    
    func generateTestJSON(numberOfElement: Int) -> String {
        var q = [Quiz]()
        
        for _ in 0...numberOfElement {
            let ans = [Answer](
                arrayLiteral: Answer(text: "Answer 1", isCorrect: false),
                Answer(text: "Answer 2", isCorrect: true),
                Answer(text: "Answer 3", isCorrect: false)
            )
            
            //            ans.append(Answer(text: "Answer 1", isCorrect: false))
            //            ans.append(Answer(text: "Answer 2", isCorrect: true))
            //            ans.append(Answer(text: "Answer 3", isCorrect: false))
            
            let qz = Quiz(mode: Mode.Easy, question: "Test question?", answers: ans)
            
            q.append(qz)
        }
        
        let JSONString = Mapper().toJSONString(q, prettyPrint: true)
        
        print(JSONString)
        
        return JSONString!
    }
  
    func getQuiz() -> Quiz {
        var currentQuiz = Quiz(mode: QuizManager.Mode.Easy, question: "Empty?", answers: [Answer](arrayLiteral: Answer(text: "Answer!", isCorrect: true)))
        
        for quiz in quizArray! {
            if quiz.getMode() == currentMode {
                print(quiz.getMode())
                currentQuiz = quiz
                break
            }
        }
        
        return currentQuiz
    }
}