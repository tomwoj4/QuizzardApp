//
//  QuestionViewController.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // the latest score object
    private var quizScore: Score!
    
    // the user's selected answer
    private var selectedAnswerIndex: Int? = nil
    
    // to display the question and it's possible answers
    @IBOutlet private weak var tableView: UITableView!
    
    // set up the table view
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
    
    func setup(quizScore: Score) {
        self.quizScore = quizScore
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "QuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionTableViewCell")
        tableView.register(UINib(nibName: "PossibleAnswerTableViewCell", bundle: nil), forCellReuseIdentifier: "PossibleAnswerTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // get the current question from the score struct
    private func currentQuestion() -> Question {
        return quizScore.quiz.questions[quizScore.currentQuestionIndex ?? 0]
    }
    
    // get the number of possible answers to display
    private func numberOfPossibleAnswers() -> Int {
        return currentQuestion().options.count
    }
    
    // tell the number of sections in the table view is 2
    // (first is the question. second is the possible answers)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // and how many cells for each section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return numberOfPossibleAnswers()
        }
    }
    
    // customise the cell at the indexPath position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // if it's the question, use a QuestionTableViewCell
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
            
            let question = currentQuestion()
            
            cell.setup(question: question)
            
            return cell
            
        // otherwise use a PossibleAnswerTableViewCell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PossibleAnswerTableViewCell", for: indexPath) as! PossibleAnswerTableViewCell
            
            let question = currentQuestion()
            let possibleAnswer = question.options[indexPath.row]
            
            cell.setup(answerText: possibleAnswer)
            
            return cell
        }
    }
    
    // when a cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        
        // store the selected index
        selectedAnswerIndex = indexPath.row
        
        // work out if there is a next question and trigger a storyboard segue
        // to the next question
        if let currentQuestionIndex = quizScore.currentQuestionIndex {
            let quiz = quizScore.quiz
            let nextQuestionIndex = currentQuestionIndex + 1
            
            if nextQuestionIndex < quiz.questions.count {
                performSegue(withIdentifier: "PresentNextQuestion", sender: self)
                return
            }
        }
        
        // or present score because no more questions
        performSegue(withIdentifier: "PresentScore", sender: self)
    }
    
    // pass the score to the correct next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedAnswerIndex = self.selectedAnswerIndex else {
            return
        }
        
        // Update answers
        let quiz = quizScore.quiz
        let currentQuestion = self.currentQuestion()
        var userAnswers = quizScore.userAnswers
        userAnswers[currentQuestion] = selectedAnswerIndex
        
        // pass the score to present score page
        if segue.identifier == "PresentScore",
            let scoreViewController = segue.destination as? ScoreViewController {
            
            let quizScore = Score(quiz: quiz,
                                  currentQuestionIndex: nil,
                                  userAnswers: userAnswers)
            
            scoreViewController.setup(quizScore: quizScore)
            
        // pass the score to the next question page
        } else if segue.identifier == "PresentNextQuestion",
            let questionViewController = segue.destination as? QuestionViewController,
            let currentQuestionIndex = quizScore.currentQuestionIndex {
            
            // Get next question
            let nextQuestionIndex = currentQuestionIndex + 1
            
            let quizScore = Score(quiz: quiz,
                                  currentQuestionIndex: nextQuestionIndex,
                                  userAnswers: userAnswers)
            
            questionViewController.setup(quizScore: quizScore)
        }
    }
}
