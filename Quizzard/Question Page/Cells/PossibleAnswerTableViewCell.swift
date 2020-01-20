//
//  PossibleAnswerTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit
import QuartzCore

class PossibleAnswerTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var answerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(answerText: String) {
        answerLabel.text = answerText
        answerLabel.layer.masksToBounds = true
        answerLabel.layer.cornerRadius = 7
    }
}
