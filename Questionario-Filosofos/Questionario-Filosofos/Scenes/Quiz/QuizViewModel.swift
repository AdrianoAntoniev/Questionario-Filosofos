//
//  StartQuizViewModel.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import Foundation

// MARK: - CoordinatorDelegate

protocol QuizViewModelCoordinatorDelegate: AnyObject {
    func buttonTapped(shouldFinish: Bool)
}

class QuizViewModel {
    private weak var delegate: QuizViewModelCoordinatorDelegate?
    let viewData: QuizViewData
    let normalStateButtonTitle: String
    let highlightStateButtonTitle: String
    
    let questionTitle: String
    let choiceOne: String
    let choiceTwo: String
    let choiceThree: String
    let choiceFour: String
    
    let shouldFinishAfterAnswer: Bool
    
    private let questions: [Question] = [
            Question(title: "Quem descobriu o Brasil?",
                     optionOne: "Pedro Álvarez Cabral",
                     optionTwo: "Carlos Manga",
                     optionThree: "José Silva",
                     optionFour: "Cristóvão Colombo"),
            Question(title: "Quem é o guitarrista dos Beatles?",
                     optionOne: "John Lennon",
                     optionTwo: "Paul McCartney",
                     optionThree: "George Harrisson",
                     optionFour: "Ringo Starr"),
            Question(title: "Quanto é 2 + 2?",
                     optionOne: "3",
                     optionTwo: "22",
                     optionThree: "4",
                     optionFour: "124321341234")]
    
    init(
        viewData: QuizViewData,
        delegate: QuizViewModelCoordinatorDelegate,
        question: Int
    ) {
        self.viewData = viewData
        self.delegate = delegate
                                
        self.normalStateButtonTitle = viewData.normalStateButtonTitle
        self.highlightStateButtonTitle = viewData.highlightStateButtonTitle
        
        self.questionTitle = questions[question].title
        self.choiceOne = questions[question].optionOne
        self.choiceTwo = questions[question].optionTwo
        self.choiceThree = questions[question].optionThree
        self.choiceFour = questions[question].optionFour
        
        self.shouldFinishAfterAnswer = question == questions.count - 1
    }
    
    func buttonTapped() {
        delegate?.buttonTapped(shouldFinish: self.shouldFinishAfterAnswer)
    }
}

// MARK: - Model for question

fileprivate struct Question {
    let title: String
    let optionOne: String
    let optionTwo: String
    let optionThree: String
    let optionFour: String
}
