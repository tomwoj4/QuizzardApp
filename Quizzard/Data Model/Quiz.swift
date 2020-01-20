//
//  Quiz.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// A Quiz with a title and an array of Questions
struct Quiz: Codable {
    let id: String
    let title: String
    let questions: [Question]
}
