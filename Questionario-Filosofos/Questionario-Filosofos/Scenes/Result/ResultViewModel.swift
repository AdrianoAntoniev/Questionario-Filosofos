//
//  ResultViewModel.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import Foundation

protocol ResultViewModelCoordinatorDelegate: AnyObject {
    func newGame()
    func finishGame()
}

class ResultViewModel {
    private weak var delegate: ResultViewModelCoordinatorDelegate?
    private var viewData: ResultViewData
    
    init(
        viewData: ResultViewData,
        delegate: ResultViewModelCoordinatorDelegate        
    ) {
        self.delegate = delegate
        self.viewData = viewData
    }
    
    var newGameButtonTitle: String {
        viewData.newGameButtonTitle
    }
    
    var exitGameButtonTitle: String {
        viewData.exitGameButtonTitle
    }
    
    var result: String {
        viewData.result
    }
    
    var resultLabelTitle: String {
        viewData.resultLabelTitle
    }
    
    func newGameTapped() {
        delegate?.newGame()
    }
    
    func exitTapped() {
        delegate?.finishGame()
    }
}


