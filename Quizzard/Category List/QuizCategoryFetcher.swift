//
//  QuizCategoryFetcher.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

class QuizCategoriesFetcher {

    // An enum to represent the result (an array of categories or an error)
    enum QuizCategoriesFetchResult {
        case success([Category])
        case fail(Error?)
    }
    
    // the parser to parse the network response into Codable structs
    let parser = QuizCategoriesParser()
    
    // The quizzard url containing the quiz categories JSON
    let url = URL(string: "https://raw.githubusercontent.com/tomwoj4/glowing-system/master/quizzard")!
    
    func fetchQuizCategories(_ completionClosure: @escaping (QuizCategoriesFetchResult) -> Void) {
    
        // create a URLSession data task to download the JSON data
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            // if it fails, then run the completionClosure as a failed case
            if let error = error {
                completionClosure(QuizCategoriesFetchResult.fail(error))
                return
            }
            
            if let data = data,
                let categories = self.parser.parse(data: data) {
                // if it succeeds, then run the completionClosure with parsed JSON data
                completionClosure(QuizCategoriesFetchResult.success(categories))
            } else {
                // or a failed case if it cannot be parsed
                completionClosure(QuizCategoriesFetchResult.fail(nil))
            }
            
            }.resume() // run the task
    }
}
