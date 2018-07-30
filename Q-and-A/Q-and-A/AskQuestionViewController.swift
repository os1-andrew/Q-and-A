//
//  AskQuestionViewController.swift
//  Q-and-A
//
//  Created by Andrew Dhan on 7/30/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

import UIKit

class AskQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitQuestion(_ sender: Any) {
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var questionField: UITextView!
    
}
