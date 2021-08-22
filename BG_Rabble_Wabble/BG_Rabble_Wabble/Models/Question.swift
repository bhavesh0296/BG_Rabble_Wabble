//
//  Questions.swift
//  BG_Rabble_Wabble
//
//  Created by bhavesh on 18/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String

    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
