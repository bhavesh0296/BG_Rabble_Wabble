//
//  BaseQuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {

    private var questionGroupCareTaker: QuestionGroupCareTaker
    private var questionGroup: QuestionGroup {
        questionGroupCareTaker.selectedQuestionGroup
    }
    private var questionIndex = 0
    private var questions: [Question]


    public init(questionGroupCaretaker: QuestionGroupCareTaker, questions: [Question]) {
        self.questionGroupCareTaker = questionGroupCaretaker
        self.questions = questions

        self.questionGroupCareTaker.selectedQuestionGroup.score = QuestionGroup.Score()
    }

    public var title: String {
        questionGroup.title
    }

    public var correctCount: Int {
        get {
            questionGroup.score.correctCount
        }
        set {
            questionGroup.score.correctCount = newValue
        }
    }

    public var incorrectCount: Int {
        get{
            questionGroup.score.incorrectCount
        }
        set {
            questionGroup.score.incorrectCount = newValue
        }
    }

    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCareTaker.save()
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1

        return true
    }

    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }

    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }

    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }

    public func questionIndexTitle() -> String {
        return "\(questionIndex+1)/\(questions.count)"
    }


}
