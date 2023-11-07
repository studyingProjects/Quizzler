//
//  ViewController.swift
//  Quizzler
//
//  Created by Under True on 06/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstChoiseButton: UIButton!
    @IBOutlet weak var secondChoiseButton: UIButton!
    @IBOutlet weak var thirdChoiseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    

    @objc func updateUI() -> Void {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstChoiseButton.setTitle(quizBrain.getAnswer(option: 0), for: .normal)
        secondChoiseButton.setTitle(quizBrain.getAnswer(option: 1), for: .normal)
        thirdChoiseButton.setTitle(quizBrain.getAnswer(option: 2), for: .normal)
        
        firstChoiseButton.backgroundColor = UIColor.clear
        secondChoiseButton.backgroundColor = UIColor.clear
        thirdChoiseButton.backgroundColor = UIColor.clear
    }
    
}

