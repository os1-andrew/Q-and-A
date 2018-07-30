//
//  QuestionTableViewCell.swift
//  Q-and-A
//
//  Created by Andrew Liao on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

protocol QuestionTableViewCellDelegate:class{
    var question: Question? {get set}
}

class QuestionTableViewCell: UITableViewCell {

    // MARK: - Methods
    
    private func updateViews(){
        guard let question = question else {return}
        questionLabel.text = question.question
        askerLabel.text = question.asker
        let status = question.answer != nil ? "Can you answer this?" : "Tap to view answer"
        
        statusLabel.text = status
    }
    
    // MARK: - Properties
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askerLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    weak var delegate:QuestionTableViewCellDelegate?
    
    var question: Question? {
        didSet{
            updateViews()
        }
    }
}
