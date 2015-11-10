//
//  DetailViewController.swift
//  iQuiz
//
//  Created by Alex N. Schenck on 11/2/15.
//  Copyright (c) 2015 Alex Schenck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var QuestionPrompt: UILabel!
    @IBOutlet weak var QuestionAnswerPicker: UIPickerView!
    @IBOutlet weak var QuestionAnswerSubmitButton: UIButton!
    @IBOutlet weak var CorrectAnswer: UILabel!
    @IBOutlet weak var CorrectAnswerIndicator: UILabel!
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var FinishButton: UIButton!
    
    @IBOutlet var QuestionView: UIView!
    @IBOutlet var AnswerView: UIView!
    @IBOutlet var FinishView: UIView!
    
    var chosenQuiz : MasterViewController.Quiz  = MasterViewController.Quiz(title: "", description: "", imagePath: "", questions: [])
    var questionNumber : Int = 0
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        // Find out what view loaded, load resulting info
        if (QuestionView != nil) {
            QuestionPrompt.text = chosenQuiz.questions[questionNumber].prompt
            questionNumber++
        }
        else if (AnswerView != nil) {
            if (questionNumber < count(chosenQuiz.questions)) {
                FinishButton.hidden = true
            }
            else {
                ContinueButton.hidden = true
            }
        }
        else if (FinishView != nil) {
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! DetailViewController
        controller.chosenQuiz = chosenQuiz
        controller.questionNumber = questionNumber
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

