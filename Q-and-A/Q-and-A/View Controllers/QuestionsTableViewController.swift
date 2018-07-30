//
//  QuestionsTableViewController.swift
//  Q-and-A
//
//  Created by Andrew Dhan on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController, QuestionTableViewCellDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questionController.questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)  as? QuestionTableViewCell else {return UITableViewCell()}
        
        let question = questionController.questions[indexPath.row]
        cell.question = question
        cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            questionController.delete(index:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToAsk" {
            guard let askVC = segue.destination as? AskQuestionViewController else {return}
            askVC.questionController = questionController
        } else if segue.identifier == "ListToAnswer"{
            guard let answerVC = segue.destination as? AnswerViewController else {return}
            answerVC.questionController = questionController
            answerVC.question = question
        }
    }
    
    
    // MARK: - Properties
    let questionController = QuestionController()
    var question: Question?
    

}
