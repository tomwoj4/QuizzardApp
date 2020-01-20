//
//  QuizCategoryListTableViewCell.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit
import QuartzCore

class QuizCategoryListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // set the cell's text to be the category's
    func setup(category: Category) {
        
        titleLabel.text = category.title
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 7
    }
    
}
