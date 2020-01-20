//
//  QuizTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit
import QuartzCore

class QuizTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // set the label to be the quiz title
    func setup(quiz: Quiz) {
        titleLabel.text = quiz.title
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 7
    }
}
