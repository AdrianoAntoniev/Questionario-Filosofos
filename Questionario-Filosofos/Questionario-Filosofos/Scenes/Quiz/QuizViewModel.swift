//
//  StartQuizViewModel.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import Foundation

// MARK: - CoordinatorDelegate

protocol QuizViewModelCoordinatorDelegate: AnyObject {
    func optionTapped(shouldFinish: Bool)
}

class QuizViewModel {
    private weak var delegate: QuizViewModelCoordinatorDelegate?    
    let question: Question
            
    init(delegate: QuizViewModelCoordinatorDelegate) {
        self.delegate = delegate        
        self.question = Questions.getCurrentQuestion()
    }
    
    func optionTapped(_ option: Int) {
        Questions.sendAnswer(question.answers[option].profile)
        delegate?.optionTapped(shouldFinish: !Questions.hasMoreQuestions)
    }
}
