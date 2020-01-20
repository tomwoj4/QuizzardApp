//
//  QuizListViewController.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class QuizListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // the different quizzes to display
    private var quizzes: [Quiz] = []
    
    // the selected quiz the user tapped
    private var selectedQuiz: Quiz? = nil
    
    // to display a list of quizzes
    @IBOutlet private weak var tableView: UITableView!

    // setup the table view
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let violetColor = UIColor(red: 0.3059, green: 0.2784, blue: 0.4, alpha: 1.0)
        
        self.tableView.backgroundColor = violetColor
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "QuizTableViewCell", bundle: nil), forCellReuseIdentifier: "QuizTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // set the quizzes to display
    func setup(quizzes: [Quiz]) {
        self.quizzes = quizzes
    }
    
    // tell the table view the amount of quizzes to display
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    
    // customise the cell at the indexPath position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell", for: indexPath) as! QuizTableViewCell
        
        let quiz = quizzes[indexPath.row]
        
        cell.setup(quiz: quiz)
        
        return cell
    }
    
    // set the selected quiz and trigger a storyboard segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quiz = quizzes[indexPath.row]
        selectedQuiz = quiz
        performSegue(withIdentifier: "PresentQuiz", sender: self)
    }
    
    // pass the selected quiz to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentQuiz",
            let quizViewController = segue.destination as? QuestionViewController,
            let quiz = selectedQuiz {
            
            let title = quiz.title
            
            let quizScore = Score(quiz: quiz, currentQuestionIndex: 0, userAnswers: [:])
            
            quizViewController.title = title
            quizViewController.setup(quizScore: quizScore)
        }
    }
}
