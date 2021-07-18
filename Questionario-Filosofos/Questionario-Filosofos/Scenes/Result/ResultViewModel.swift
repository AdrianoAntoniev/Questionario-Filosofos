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
    
    init(
        delegate: ResultViewModelCoordinatorDelegate
    ) {
        self.delegate = delegate
    }
    
    func newGameTapped() {
        delegate?.newGame()
    }
    
    func exitTapped() {
        delegate?.finishGame()
    }
}


