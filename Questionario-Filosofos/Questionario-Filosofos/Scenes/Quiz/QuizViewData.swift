//
//  StartQuizViewData.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import Foundation

struct QuizViewData {
    let normalStateButtonTitle: String
    let highlightStateButtonTitle: String
    
    init(
        normalStateButtonTitle: String,
        highlightStateButtonTitle: String
    ) {
        self.normalStateButtonTitle = normalStateButtonTitle
        self.highlightStateButtonTitle = highlightStateButtonTitle
    }
}
