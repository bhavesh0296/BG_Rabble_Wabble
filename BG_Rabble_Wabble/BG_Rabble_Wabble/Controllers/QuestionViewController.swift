//
//  ViewController.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 18/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

public class QuestionViewController: UIViewController {

    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0

    public var correctCount = 0
    public var incorrectCount = 0

    public var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        return (view as! QuestionView)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    //MARK:- IBAction
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden.toggle()
        questionView.hintLabel.isHidden.toggle()
    }

    @IBAction func handleCorrect(_ sender: UIButton) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }

    @IBAction func handleIncorrect(_ sender: UIButton) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }

    //MARK:- Helper Methods
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            print("reach upto end of questions")
            return
        }
        showQuestion()
    }

    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]

        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.text = question.answer

        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }

}

