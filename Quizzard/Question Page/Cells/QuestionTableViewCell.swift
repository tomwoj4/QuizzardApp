//
//  QuestionTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var questionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(question: Question) {
        questionLabel.text = question.question
    }
}
