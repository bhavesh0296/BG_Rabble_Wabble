//
//  QuestionGroupBuilder.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public class QuestionBuilder {

    public var answer = ""
    public var prompt = ""
    public var hint = ""

    public enum Error: String, Swift.Error {
        case missingAnswer
        case missingPrompt
    }

    public func build() throws -> Question {
        guard !answer.isEmpty else { throw Error.missingAnswer }
        guard !prompt.isEmpty else { throw Error.missingPrompt }
        return Question(answer: answer, hint: hint, prompt: prompt)
    }

}

public class QuestionGroupBuilder {
    public var questions = [QuestionBuilder()]
    public var title: String = ""

    public func addNewQuestion() {
        let question = QuestionBuilder()
        questions.append(question)
    }

    public func removeQuestion(at index: Int) {
        questions.remove(at: index)
    }

    public enum Error: String, Swift.Error {
        case missingTitle
        case missingQuestions
    }

    public func build() throws -> QuestionGroup {
        guard !title.isEmpty else { throw Error.missingTitle }
        guard !questions.isEmpty else { throw Error.missingQuestions }
        let questions = try self.questions.map{ try $0.build() }
        return QuestionGroup(questions: questions, title: title)
    }

}
