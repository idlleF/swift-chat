//
//  ViewController.swift
//  quizz
//
//  Created by Irko Stoyanov on 5.01.19.
//  Copyright © 2019 Irko Stoyanov. All rights reserved.
//

import UIKit
import Alamofire

class PlayController: UIViewController {
    
    @IBOutlet weak var qText: UILabel!
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var strikes: UILabel!
    
    var c_answer = ""
    var first_answer = ""
    var second_answer = ""
    var used = Array<Any>()
    var difficulty = "Easy"
    var strikesCount = 0
    var qID = String()
    var game:Game = Game(difficulty: "Easy")
    var question = Question()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestions()
        strikes.text = "0"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SuccessController {
            vc.strikes = self.strikesCount
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toHomeMenu", sender: nil)
    }
    
    //getQuestions || populateQuestions
    func getQuestions() {
        
        self.game = Game.init(difficulty: "Easy")
        //TODO show progress
        self.game.getAllQuestions { questions in
            //TODO hide progress
            if(self.game.gameReady){
                //hide progress
            } else {
                // self.game.getAllQuestions
                // show message to the user something went wrong please reset your game
            }
            self.getNextQuestion()
        }
      
    }
    func getNextQuestion(){
        if(self.game.isGameReady()){
            self.question = self.game.getNextQuestion()
            if(!self.game.noQuestions) {
                qText.text = self.question.question
                let answers = self.question.answers[0].components(separatedBy: ", ")
                let firstAnswer: String = answers[0]
                let secondAnswer: String = answers[1]
                firstBtn.setTitle(firstAnswer, for: .normal)
                secondBtn.setTitle(secondAnswer, for: .normal)
            } else {
                self.game.strikes = 0
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let homeController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeController
                self.present(homeController, animated: true, completion: nil)
            }
        }
    }
    
    
    //showAnimation based ot true/false param
    //callback - game.getNewQuestion()

    @IBAction func answerPressed(_ sender: UIButton) {
        if(sender.tag == self.question.correctAnswer) {
            self.game.strikes = self.game.strikes + 1
            strikes.text = "\(self.game.strikes)"
            
            self.getNextQuestion()
        } else {
           print("Wrong answer!")
        }
    }
    
}
