//
//  QuizCategoriesResponse.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// The top level structure of the server's JSON response
// Codable so the JSON parsing can be handled automatically
struct QuizCategoriesResponse: Codable {
    
    // A list of different categories
    let categories: [Category]
}
