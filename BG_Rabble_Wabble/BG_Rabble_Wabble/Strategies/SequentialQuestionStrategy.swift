//
//  SequentialQuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class SequentialQuestionStrategy: QuestionStrategy {


    // MARK: - Properties
    public var correctCount = 0
    public var incorrectCount = 0
    public var questionGroup: QuestionGroup
    public var questionIndex = 0

    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }

    var title: String {
        return questionGroup.title
    }


    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }

    func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }

    func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }

    func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }

    func questionIndexTitle() -> String {
        return "\(questionIndex+1)/\(questionGroup.questions.count)"
    }

}
