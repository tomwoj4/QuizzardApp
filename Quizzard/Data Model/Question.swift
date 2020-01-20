//
//  QuestionQuestion.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// A Question with an array of different possible options as answers,
// including the index of the correct answer
// Hashable so that it can be used in a dictionary as the key
// And equatable so '==' operations can be performed.
struct Question: Codable, Hashable, Equatable {
    let id: String
    let question: String
    let options: [String]
    let answer: Int
}
