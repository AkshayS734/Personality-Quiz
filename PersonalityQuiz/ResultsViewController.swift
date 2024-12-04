//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Batch - 1 on 27/11/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer] = []  // Default empty array
        
        // Custom initializer
        init?(coder: NSCoder, responses: [Answer]) {
            self.responses = responses
            super.init(coder: coder)
        }

        // Required init(coder:) for storyboards
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            calculatePersonalityResult()
            navigationItem.hidesBackButton = true
        }
        func calculatePersonalityResult() {
            let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in
                counts[answer.type, default: 0] += 1
            }
            let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
            resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
        }
    
}
