//
//  StartQuizViewData.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import Foundation

struct StartQuizViewData {
    let imageName: String
    let labelTitle: String
    let normalStateButtonTitle: String
    let highlightStateButtonTitle: String
    
    init(
        imageName: String,
        labelTitle: String,
        normalStateButtonTitle: String,
        highlightStateButtonTitle: String
    ) {
        self.imageName = imageName
        self.labelTitle = labelTitle
        self.normalStateButtonTitle = normalStateButtonTitle
        self.highlightStateButtonTitle = highlightStateButtonTitle
    }
}
