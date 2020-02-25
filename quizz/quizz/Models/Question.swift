//
//  Question.swift
//  quizz
//
//  Created by Irko Stoyanov on 31.01.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import Foundation

class Question {
    var id:Int = 0
    var question:String = ""
    var difficulty:String = ""
    var correctAnswer:Int = 0
    var answers:[String] = []
    //score per question []
    //is correct
    var showned:Bool = false
    
    func setQuestion(id: Int, question: String, difficulty: String, correctAnswer: Int, answers: [String]) {
        self.id = id
        self.question = question
        self.difficulty = difficulty
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
//    init(id: Int, question: String, difficulty: String, correctAnswer: Int, answers: Array<Any>) {
//        self.id = id
//        self.question = question
//        self.difficulty = difficulty
//        self.correctAnswer = correctAnswer
//        self.answers = answers
//    }
}
