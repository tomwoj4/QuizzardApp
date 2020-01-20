//
//  ScoreViewController.swift
//  Quizzard
//
//  Created by Tom Wojcik on 23/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // to display the user's score
    @IBOutlet weak var tableView: UITableView!
    
    // the score to display
    private var quizScore: Score!
    
    // return to the quizzes
    @IBAction func nextQuiz(_ sender: Any) {
        performSegue(withIdentifier: "nextQuiz", sender: self)
    }
    
    // share the user's result
    @IBAction func shareScore(_ sender: Any) {
        
        // build a message to share
        let scoreViewData = createScoreViewData().amountMessage
        
        let activityItem = "I just scored \(scoreViewData) on Quizzard!  Download the app to see if you can do better!"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [activityItem], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        
        //exclude
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        
        // present the share sheet
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // set up the table view
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let violetColor = UIColor(red: 0.3059, green: 0.2784, blue: 0.4, alpha: 1.0)
        
        self.tableView.backgroundColor = violetColor

        self.navigationItem.title = "Scores"
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: "FeedbackTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedbackTableViewCell")
        self.tableView.register(UINib(nibName: "AnswerResultTableViewCell", bundle: nil), forCellReuseIdentifier: "AnswerResultTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // set the score to display
    func setup(quizScore: Score) {
        self.quizScore = quizScore
    }
    
    // calculate the score to display
    private func createScoreViewData() -> ScoreViewData {
        let scoreCalculator = ScoreCalculator(score: quizScore)
        return scoreCalculator.scoreViewData()
    }
    
    // tell the table view to display 2 sections
    // (first is the summary, second is the correct answers)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // tell the table view the number of rows per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return quizScore.quiz.questions.count
        }
    }
    
    // customise the row at the indexPath position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // display a summary
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackTableViewCell", for: indexPath) as! FeedbackTableViewCell
            
            let scoreViewData = self.createScoreViewData()
            
            cell.setup(scoreViewData: scoreViewData)
            
            return cell
            
        // display the correct answer
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerResultTableViewCell", for: indexPath) as! AnswerResultTableViewCell
            
            let question = quizScore.quiz.questions[indexPath.row]
            let userAnswer = quizScore.userAnswers[question]!
            
            cell.setup(question: question, userAnswerIndex: userAnswer)
            
            return cell
        }
    }
}

//allows for custom buttons
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
