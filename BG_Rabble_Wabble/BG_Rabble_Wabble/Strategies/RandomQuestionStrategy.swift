//
//  RandomQuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {

    // MARK:- Properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    public var questionIndex: Int = 0
    public var questionGroup: QuestionGroup
    public var questions: [Question]

    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup

        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(
        in: questionGroup.questions) as! [Question]
    }

    public var title: String {
        questionGroup.title
    }

    public func advanceToNextQuestion() -> Bool {
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
