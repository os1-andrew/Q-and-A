//
//  AnswerViewController.swift
//  Q-and-A
//
//  Created by Andrew Dhan on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        guard let name = nameInput.text,
            let answer = answerInput.text,
            let question = question else {return }
        
        questionLabel.text = question.question
        askerLabel.text = question.asker
        if name != "" && answer != ""{
            questionController?.update(question: question, withAnswer: answer, answeredBy: name)
            
        }
        
    }
    
    //MARK: - Properties
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askerLabel: UILabel!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var answerInput: UITextView!
    
    var questionController:QuestionController?
    var question: Question?
}
