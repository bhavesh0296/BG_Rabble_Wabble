//
//  QuestionGroup.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 18/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation
import Combine

public class QuestionGroup: Codable {
    public let questions: [Question]
    public let title: String
    public private(set) var score: Score

    public class Score: Codable {
        public var correctCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }
        public var incorrectCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }

        @Published public var runningPercentage: Double = 0

        private enum CodingKeys: String, CodingKey {
            case correctCount
            case incorrectCount
        }
        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.correctCount = try container.decode(Int.self, forKey: .correctCount)
            self.incorrectCount = try container.decode(Int.self, forKey: .incorrectCount)
            updateRunningPercentage()
        }

        private func updateRunningPercentage() {
            let totalCount = correctCount + incorrectCount
            guard totalCount > 0 else {
                runningPercentage = 0
                return
            }
            runningPercentage = Double(correctCount) / Double(totalCount)
        }

        public func reset() {
            correctCount = 0
            incorrectCount = 0
        }
    }



    public init(questions: [Question], title: String, score: Score = Score()) {
        self.questions = questions
        self.title = title
        self.score = score
    }
}
