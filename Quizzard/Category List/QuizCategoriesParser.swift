//
//  QuizCategoriesParser.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

// Used to parse JSON Data into an array of categories
class QuizCategoriesParser {
    
    func parse(data: Data) -> [Category]? {
        
        // Use JSONDecoder to decode JSON into a QuizCategoriesResponse structure
        let quizCategoriesJSONDecoder = JSONDecoder()
        do {
            let response = try quizCategoriesJSONDecoder.decode(QuizCategoriesResponse.self, from: data)
            return response.categories
        } catch {
            // print an error and return nil if an exception is thrown
            print("Failed to decode: \(error.localizedDescription)")
        }
        
        return nil
    }
}
