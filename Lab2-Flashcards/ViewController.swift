//
//  ViewController.swift
//  Lab2-Flashcards
//
//  Created by Kavey Zheng on 9/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapOnFlashcard(_ sender: Any) {
        if (questionLabel.isHidden == false) {
            questionLabel.isHidden = true
        } else {
            questionLabel.isHidden = false
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        questionLabel.isHidden = false
        questionLabel.text = question
        answerLabel.text = answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = questionLabel.text
            creationController.initialAnswer = answerLabel.text
        }
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
    }
}
