//
//  AppSetting.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public class AppSettings {

    public static let shared = AppSettings()

    private init() { }

    private struct keys {
        static let questionStrategy = "questionStrategy"
    }

    private let userDefaults = UserDefaults.standard

    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: keys.questionStrategy)
        }
    }

//    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
//        return questionStrategyType.questionStrategy(for: questionGroup)
//        return questionStrategyType.questionStrategy(for: )
//    }

    public func questionStrategy(for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCareTaker)
    }


}

public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential

    var title: String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }

//    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
//        switch self {
//        case .random:
//            return RandomQuestionStrategy(questionGroup: questionGroup)
//        case .sequential:
//            return SequentialQuestionStrategy(questionGroup: questionGroup)
//        }
//    }

    public func questionStrategy(for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroupCareTaker: questionGroupCareTaker)
        case .sequential:
            return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCareTaker)
        }
    }
}
