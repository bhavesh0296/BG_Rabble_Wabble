//
//  SequentialQuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

class SequentialQuestionStrategy: BaseQuestionStrategy {


    public convenience init(questionGroupCaretaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCaretaker: questionGroupCaretaker, questions: questions)
    }

}
