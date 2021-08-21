//
//  QuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    var title: String { get }

    var correctCount: Int { get }
    var incorrectCount: Int { get }

    func advanceToNextQuestion() -> Bool

    func currentQuestion() -> Question

    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)

    func questionIndexTitle() -> String

}
