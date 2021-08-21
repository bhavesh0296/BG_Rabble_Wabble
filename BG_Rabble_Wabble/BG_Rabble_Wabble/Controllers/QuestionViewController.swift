//
//  ViewController.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 18/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

public class QuestionViewController: UIViewController {

//    public var questionGroup = QuestionGroup.basicPhrases()
//    public var questionGroup: QuestionGroup! {
//        didSet {
//            navigationItem.title = questionGroup.title
//        }
//    }

    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "",
                                   style: .plain,
                                   target: nil,
                                   action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()

    public var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }

    public weak var delegate: QuestionViewControllerDelegate?
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
        setupCancelButton()
        showQuestion()
    }

    //MARK:- IBAction
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden.toggle()
        questionView.hintLabel.isHidden.toggle()
    }

    @IBAction func handleCorrect(_ sender: UIButton) {
//        correctCount += 1
//        questionView.correctCountLabel.text = "\(correctCount)"
//        showNextQuestion()

        let question = questionStrategy.currentQuestion()

        questionStrategy.markQuestionCorrect(question)
        questionView.correctCountLabel.text = "\(questionStrategy.correctCount)"
        showNextQuestion()
    }

    @IBAction func handleIncorrect(_ sender: UIButton) {
//        incorrectCount += 1
//        questionView.incorrectCountLabel.text = "\(incorrectCount)"
//        showNextQuestion()

        let question = questionStrategy.currentQuestion()

        questionStrategy.markQuestionIncorrect(question)
        questionView.incorrectCountLabel.text = "\(questionStrategy.incorrectCount)"
        showNextQuestion()
    }

    //MARK:- Helper Methods
    private func showNextQuestion() {
        /*
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            print("reach upto end of questions")
            delegate?.questionViewController(self, didComplete: questionGroup)
            return
        }
        showQuestion()
        */

        guard questionStrategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self,
                                             didComplete: questionStrategy)
            return
        }
        showQuestion()
    }

    private func showQuestion() {
        /*
        let question = questionGroup.questions[questionIndex]

        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.text = question.answer

        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true

        questionIndexItem.title = "\(questionIndex + 1)/\(questionGroup.questions.count) "
        */

        let question = questionStrategy.currentQuestion()
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        questionView.answerLabel.text = question.answer

        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true

        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }

    private func setupCancelButton() {
        let action = #selector(handleCancelButton(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .plain,
                                                           target: self,
                                                           action: action)
    }

    @objc func handleCancelButton(sender: Any) {
        delegate?.questionViewController(self,
                                         didCancel: questionStrategy,
                                         at: questionIndex)
    }
}

public protocol QuestionViewControllerDelegate: class {

    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy, at questionIndex: Int)

    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy)
}
