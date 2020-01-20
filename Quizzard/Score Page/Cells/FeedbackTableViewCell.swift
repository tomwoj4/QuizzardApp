//
//  FeedbackTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var amountMessageLabel: UILabel!
    @IBOutlet private weak var scoreMessageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(scoreViewData: ScoreViewData) {
        amountMessageLabel.text = scoreViewData.amountMessage
        scoreMessageLabel.text = scoreViewData.scoreMessage
    }
}
