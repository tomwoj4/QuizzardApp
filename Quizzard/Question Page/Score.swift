//
//  QuizScore.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// The score object holds the current quiz information
// and is a struct so that it cannot be changed by other pages
// only a new one can be created
struct Score {
    
    // the current quiz being played
    let quiz: Quiz
    
    // the index of the current quiz question to display
    let currentQuestionIndex: Int?
    
    // the answer index for each question (what the user has answered so far)
    let userAnswers: [Question: Int]
}
