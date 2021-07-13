//
//  QuizCoordinator.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 12/07/21.
//

import UIKit

protocol QuizCoordinatorDelegate: AnyObject {
    func nextQuestionTapped()
    func calculateResults()
}

class QuizCoordinator: Coordinator {
    weak var delegate: QuizCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let question: Int
    
    init(
        navigationController: UINavigationController,
        question: Int,
        delegate: QuizCoordinatorDelegate
        ) {
        self.navigationController = navigationController
        self.delegate = delegate
        self.question = question
    }
    
    func start() {
        let viewData = QuizViewData(
                                    normalStateButtonTitle: "Confirmar questão \(question + 1)",
                                    highlightStateButtonTitle: "Aguarde..."
                                    )
        
        let viewModel = QuizViewModel(viewData: viewData,
                                           delegate: self,
                                           question: question)
        let viewController = QuizViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension QuizCoordinator: QuizViewModelCoordinatorDelegate {
    func buttonTapped(shouldFinish: Bool) {
        shouldFinish ? delegate?.calculateResults() : delegate?.nextQuestionTapped()        
    }
}
