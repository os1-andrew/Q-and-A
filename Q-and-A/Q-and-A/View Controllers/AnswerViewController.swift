//
//  AnswerViewController.swift
//  Q-and-A
//
//  Created by Andrew Liao on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        guard let name = nameInput.text,
            let answer = answerInput.text,
            let question = question else {return }
        
        
        if name != "" && answer != ""{
            questionController?.update(question: question, withAnswer: answer, answeredBy: name)
            
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews(){
        guard let question = question else {
            
            fatalError("NO QUESTION!!")}
        
        self.title = question.question
        questionLabel.text = question.question
        askerLabel.text = question.asker
        
        if(question.answer != nil){
            nameInput.text = question.answerer
            answerInput.text = question.answer
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
