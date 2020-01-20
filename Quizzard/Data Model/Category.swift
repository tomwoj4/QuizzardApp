//
//  Category.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// A quiz category with a title and array of Quizes
struct Category: Codable {
    let id: String
    let title: String
    let quizzes: [Quiz]
}
