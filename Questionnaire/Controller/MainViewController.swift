//
//  MainViewController.swift
//  Questionnaire
//
//  Created by home on 5/4/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit
import QuartzCore

class MainViewController: UIViewController {

    @IBOutlet var mainQuestion: UILabel!
    
    @IBOutlet var secondQuestionLbl: UILabel!
    
    @IBOutlet var firstQuestionLbl: UILabel!
    
    
    
    @IBOutlet var thirdQuestionLbl: UILabel!
    @IBOutlet var fourthQuestionLbl: UILabel!
    @IBOutlet var fifthQuestionLbl: UILabel!
    
    @IBOutlet var numberOfQuestion: UILabel!
    
    @IBOutlet var firstSwitch: UISwitch!
    @IBOutlet var secondSwitch: UISwitch!
    @IBOutlet var thirdSwitch: UISwitch!
    @IBOutlet var fourthSwitch: UISwitch!
    @IBOutlet var fifthSwitch: UISwitch!
    
    
    @IBOutlet var replyButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        replyButton.layer.cornerRadius = 10
        
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 8
        progressBar.subviews[1].clipsToBounds = true
        
        mainQuestion.layer.cornerRadius = 10
        mainQuestion.layer.borderWidth = 2
        mainQuestion.layer.borderColor = #colorLiteral(red: 0.192917943, green: 0.2913616896, blue: 0.426486969, alpha: 1)
    }
    
    
    
    // array with questions and answers
    var questions: [Question] = [
        
        Question(
            text:"Выберите предмет...",
            answers: [
                Answer(text: "Камень", type: .Sloupok),
                Answer(text: "Крест", type: .Pikachy),
                Answer(text: "Балахон", type: .Lucario),
                Answer(text: "Фолиант", type: .Slugma),
                Answer(text: "Кинжал", type: .Vaperon)
            ]
        ),
        Question(
            text:"Всем приходится работать по дому. Что утомляет тебя быстрее ?",
            answers: [
                Answer(text: "Мытье посуды", type: .Sloupok),
                Answer(text: "Вытирание пыли", type: .Pikachy),
                Answer(text: "Стирка, глажка", type: .Lucario),
                Answer(text: "Пылесосить", type: .Slugma),
                Answer(text: "Уборка за домашними животными", type: .Vaperon)
            ]
        ),
        Question(
            text:"Что из этого точно про тебя ?",
            answers: [
                Answer(text: "Отличаюсь редкой добротой", type: .Sloupok),
                Answer(text: "Хам и нахал", type: .Pikachy),
                Answer(text: "Я жадный", type: .Lucario),
                Answer(text: "Предан своему делу", type: .Slugma),
                Answer(text: "Очень амбициозен", type: .Vaperon)
            ]
        ),
        Question(
            text:"В детсвте ты мечтал стать...",
            answers: [
                Answer(text: "Ведущим комического шоу", type: .Sloupok),
                Answer(text: "Бесстрашным журналистом", type: .Pikachy),
                Answer(text: "Спортсменом", type: .Lucario),
                Answer(text: "Президентом мира", type: .Slugma),
                Answer(text: "Ученым", type: .Vaperon)
            ]
        ),
        Question(
            text:"Утро лучше начать с...",
            answers: [
                Answer(text: "Пробежки", type: .Sloupok),
                Answer(text: "Душа", type: .Pikachy),
                Answer(text: "Работы", type: .Lucario),
                Answer(text: "Здоровой пищи", type: .Slugma),
                Answer(text: "Опохмела", type: .Vaperon)
            ]
        )
    ]
    
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    //func
    func updateUI() {
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        numberOfQuestion.text = "\(questionIndex+1)/5"
        mainQuestion.text = currentQuestion.text
        progressBar.setProgress(totalProgress, animated: true)
        updateMultipleStack(using: currentAnswers)
    }
    
    
    //func
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        if firstSwitch.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if secondSwitch.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if thirdSwitch.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if fourthSwitch.isOn {
            answersChosen.append(currentAnswers[3])
        }
        if fifthSwitch.isOn {
            answersChosen.append(currentAnswers[4])
        }
        
        nextQuestion()
    }
    
    //func
    func updateMultipleStack(using answers: [Answer]) {
        
        firstSwitch.isOn = false
        secondSwitch.isOn = false
        thirdSwitch.isOn = false
        fourthSwitch.isOn = false
        fifthSwitch.isOn = false
        firstQuestionLbl.text = answers[0].text
        secondQuestionLbl.text = answers[1].text
        thirdQuestionLbl.text = answers[2].text
        fourthQuestionLbl.text = answers[3].text
        fifthQuestionLbl.text = answers[4].text
    }
    
    //func that update curren question to next
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultSegue" {
            let resultsViewController = segue.destination as! ResultViewController
            resultsViewController.responses = answersChosen
            
        }
    }
}
