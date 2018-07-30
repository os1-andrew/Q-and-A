//
//  QuestionController.swift
//  Q-and-A
//
//  Created by Andrew Liao on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import Foundation

class QuestionController {
//    Create An array of Question objects called questions that will be used as the data source for the application. A "Create" function that will initialize a Question object and add it to the questions array. An "Update" function that takes in a Question (that you want to update), answer string, and an answerer string to add to the question. A "Delete" function that takes in a Question to be deleted, and removes it from the questions array.
    
    func create(question:String, askedBy name:String){
        let question = Question(question: question, asker: name)
        questions.append(question)
    }
    
    func update(question:Question, withAnswer answer:String, answeredBy name: String){
        guard let index = questions.index(of: question) else {return}
        var temporary = questions[index]
        temporary.answer = answer
        temporary.answerer = name
        
        questions.remove(at: index)
        questions.insert(temporary, at: index)
    }
    
    func delete(index: Int){
        questions.remove(at: index)
    }
    
    //Mark: - Properties
    private(set) var questions = [Question]()
}
