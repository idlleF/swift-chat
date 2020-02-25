//
//  Game.swift
//  quizz
//
//  Created by Irko Stoyanov on 31.01.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Game {
    var record:Int = 0
    var strikes:Int = 0
    var points:Int = 0
    var questions = [Question]()
    var difficulty:String = "Easy"
    var noQuestions: Bool = false
    var gameReady:Bool = false
    
    enum Difficulties: String {
        case Easy = "Easy",Medium="Medium", Hard="Hard", neptune
    }
    
    
    init(difficulty: String) {
        self.difficulty = difficulty
    }
    
    func getAllQuestions( completed: @escaping((_ response: [Question]) -> Void)) {
        if(self.questions.count > 0 && self.gameReady){
            completed(self.questions);
        }
        self.populateQuestions(diff: Difficulties.Easy.rawValue) {response in
            self.questions = response
            if(response.count > 0){
                self.gameReady = true
            }
            completed(response);
        }

    }
    
    func getNextQuestion() -> Question {
        let questions = self.getNotShownedQuestions()
        if (questions.count > 0) {
            let question = questions.randomElement()!
            question.showned = true
            return question
        } else {
            self.noQuestions = true
            return Question()
        }
    }
    
    func getNotShownedQuestions() -> [Question] {
        var returnArray = [Question]()
        for q in self.questions {
            if(!q.showned) {
                returnArray.append(q)
            }
        }
        return returnArray
    }
    
    func populateQuestions(diff:String, completed: @escaping((_ response: [Question]) -> Void)) {
        self.difficulty = diff
        let params : Parameters =  [
            "difficulty": self.difficulty,
            "deviceID" : UIDevice.current.identifierForVendor!.uuidString
        ]
        Alamofire.request(BASE_URL + "/question", method: .get, parameters: params, encoding: JSONEncoding.default,  headers: HEADER).responseJSON { (response) in
            do {
                if response.result.error == nil {
                    guard let data = response.data else { return }
                    let qData = try JSON(data: data)
                    for (_, q) in qData["data"] {
                        let questionObj = Question()
                        questionObj.setQuestion(id: q["id"].intValue, question: q["question"].stringValue, difficulty: q["difficulty"].stringValue, correctAnswer: q["correct_answer"].intValue, answers: [q["answers"].stringValue])
                        self.questions.append(questionObj)
                    }
                    completed(self.questions)
                }
            } catch let error {
                print("Error: \(error)")
            }
            
        }
    }
    
    
    func isGameReady() -> Bool {
        return self.gameReady && self.questions.count > 0
    }
    
    // property current question 0 - n
    // property of type array of Question model
    
    // function setQUestions get called from populating question from API method - inside it reset current question each time, reset score ( not the global one ), reset everything u need
    
    //scores - zvezdite, % based
    // function calculateZvezdi :D
    // if !correct - skip
    
    //function getNewQuestion() - return next question from array
    
    
    //score per question
    //score per game
}
