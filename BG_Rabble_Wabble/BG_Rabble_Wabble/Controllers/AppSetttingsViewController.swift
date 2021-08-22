//
//  AppSetttingsViewController.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit

class AppSetttingsViewController: UITableViewController {

    //MARK:- Properties
    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

}

extension AppSetttingsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        cell.textLabel?.text = questionStrategyType.title

        cell.accessoryType = appSettings.questionStrategyType == questionStrategyType ? .checkmark : .none

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
    }

}
