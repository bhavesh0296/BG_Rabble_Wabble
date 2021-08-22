//
//  QuestionGroup.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 18/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public class QuestionGroup: Codable {
    public let questions: [Question]
    public let title: String

    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        public init() {}
    }

    public var score: Score

    public init(questions: [Question], title: String, score: Score = Score()) {
        self.questions = questions
        self.title = title
        self.score = score
    }

}
