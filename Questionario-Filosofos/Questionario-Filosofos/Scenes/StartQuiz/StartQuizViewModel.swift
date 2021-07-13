//
//  StartQuizViewModel.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import Foundation

// MARK: - CoordinatorDelegate

protocol StartQuizViewModelCoordinatorDelegate: AnyObject {
    func buttonTapped()
}

class StartQuizViewModel {
    private weak var delegate: StartQuizViewModelCoordinatorDelegate?
    let viewData: StartQuizViewData
    let imageName: String
    let labelTitle: String
    let normalStateButtonTitle: String
    let highlightStateButtonTitle: String
    
    init(
        viewData: StartQuizViewData,
        delegate: StartQuizViewModelCoordinatorDelegate
    ) {
        self.viewData = viewData
        self.delegate = delegate
        
        self.imageName = viewData.imageName
        self.labelTitle = viewData.labelTitle
        self.normalStateButtonTitle = viewData.normalStateButtonTitle
        self.highlightStateButtonTitle = viewData.highlightStateButtonTitle        
    }
    
    func buttonTapped() {
        delegate?.buttonTapped()
    }
}
