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

    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuestionGroupCell.self), for: indexPath) as! QuestionGroupCell
        cell.titleLabel.text = questionGroups[indexPath.row].title
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
        viewController.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
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
