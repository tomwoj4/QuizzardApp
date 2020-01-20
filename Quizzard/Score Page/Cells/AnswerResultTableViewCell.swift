//
//  AnswerResultTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class AnswerResultTableViewCell: UITableViewCell {
    
    private let greenColor = UIColor(red: 0.2941, green: 0.5882, blue: 0, alpha: 1.0)
    private let redColor = UIColor(red: 0.9098, green: 0, blue: 0, alpha: 1.0)
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var userAnswerLabel: UILabel!
    @IBOutlet private weak var correctAnswerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(question: Question, userAnswerIndex: Int) {
        let correctAnswer = userAnswerIndex == question.answer
        questionLabel.text = question.question
        userAnswerLabel.text = question.options[userAnswerIndex]
        correctAnswerLabel.text = question.options[question.answer]
        correctAnswerLabel.isHidden = correctAnswer
        
        userAnswerLabel.textColor = correctAnswer ? greenColor : redColor
        
    }
}
