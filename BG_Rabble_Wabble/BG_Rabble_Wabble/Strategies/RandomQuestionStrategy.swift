//
//  RandomQuestionStrategy.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 22/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {

    public convenience init(questionGroupCareTaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCareTaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        self.init(questionGroupCaretaker: questionGroupCareTaker, questions: questions)
    }

}
