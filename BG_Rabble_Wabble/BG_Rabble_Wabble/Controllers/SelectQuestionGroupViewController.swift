//
//  SelectQuestionGroupViewController.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 21/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class SelectQuestionGroupViewController: UIViewController {


    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }

//    public let questionGroups = QuestionGroup.allGroups()

    private let questionGroupCaretaker = QuestionGroupCareTaker()
    private var questionGroups: [QuestionGroup] {
        questionGroupCaretaker.questionGroups
    }

//    private var selectedQuestionGroup: QuestionGroup!

    private var selectedQuestionGroup: QuestionGroup! {
        get {
            return questionGroupCaretaker.selectedQuestionGroup
        }
        set {
            questionGroupCaretaker.selectedQuestionGroup = newValue
        }
    }

    private let appSettings = AppSettings.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        questionGroups.forEach { print("\($0.title): Correct: \($0.score.correctCount), Incorrrect: \($0.score.incorrectCount)")
        }
    }

}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuestionGroupCell.self), for: indexPath) as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        cell.percentageSubscriber = questionGroup.score.$runningPercentage.receive(on: DispatchQueue.main).map {
            return String(format: "%.0f %%", round(100 * $0))
        }.assign(to: \.text, on: cell.percentageLabel)
        return cell
    }

}

extension SelectQuestionGroupViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Group \(questionGroups[indexPath.row].title)")
//        selectionQuestionGroup = questionGroups[indexPath.row]
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? QuestionViewController else {
            return
        }
//        viewController.questionGroup = selectionQuestionGroup
//        viewController.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
//        viewController.questionStrategy = appSettings.questionStrategy(for: selectedQuestionGroup)
        viewController.questionStrategy = appSettings.questionStrategy(for: questionGroupCaretaker)
        viewController.delegate = self
    }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {

    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy, at questionIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }

    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }


}
