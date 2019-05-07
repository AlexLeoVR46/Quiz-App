//
//  ResultViewController.swift
//  Questionnaire
//
//  Created by home on 5/4/19.
//  Copyright © 2019 home. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultImageLabel: UIImageView!
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        self.navigationItem.rightBarButtonItem?.titleTextAttributes(for: UIControl.State.normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResult() {
       
        var frequencyOfAnswers: [PokemonType:Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "Ты - \(mostCommonAnswer.self)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        resultImageLabel.image = mostCommonAnswer.image
        
        
        UIView.animate(withDuration: 1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            // HERE
            self.resultImageLabel.transform = CGAffineTransform.identity.scaledBy(x: 1.7, y: 1.7) // Scale your image
            
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                
                self.resultImageLabel.transform = CGAffineTransform.identity // undo in 1 seconds
            })
        }
    }
  
     
    }


