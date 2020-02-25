//
//  QuestionBank.swift
//  quizz
//
//  Created by Irko Stoyanov on 10.02.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class QuestionBank {
    var questions = [Question]()
    let difficulty: String
    
    init(difficulty: String, completed: @escaping((_ response: [Question]) -> Void)) {
        self.difficulty = difficulty
        let params : Parameters =  [
            "difficulty": self.difficulty,
            "deviceID" : UIDevice.current.identifierForVendor!.uuidString
        ]
        Alamofire.request(BASE_URL + "/question", method: .get, parameters: params, encoding: JSONEncoding.default,  headers: HEADER).responseJSON { (response) in
            do {
                if response.result.error == nil {
                    //Game questions = questions
                    //game - setQuestions(returnedQuestions);
                    // call showQuestions(game);
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
    
    func getSingleQuestion() {
        let q = self.questions[0]
        print(q)
    }
}
