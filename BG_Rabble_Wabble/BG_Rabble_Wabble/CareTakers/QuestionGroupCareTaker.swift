//
//  QuestionGroupCareTaker.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public final class QuestionGroupCareTaker {

    private let fileName: String = "QuestionGroupData"

    public var questionGroups: [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!

    public init() {
        loadQuestionGroup()
    }

    private func loadQuestionGroup() {
        if let questionGroups = try? DiskCareTaker.retrive([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCareTaker.retrive([QuestionGroup].self, from: url)
            try! save()
        }
    }

    public func save() throws {
        try DiskCareTaker.save(questionGroups, to: fileName)
    }
}
