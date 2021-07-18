//
//  QuizCoordinator.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 12/07/21.
//

import UIKit

protocol QuizCoordinatorDelegate: AnyObject {
    func nextQuestionTapped(shouldFinish: Bool)
}

class QuizCoordinator: Coordinator {
    weak var delegate: QuizCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController,
        delegate: QuizCoordinatorDelegate
        ) {
        self.navigationController = navigationController
        self.delegate = delegate        
    }
    
    func start() {
        let viewModel = QuizViewModel(delegate: self)
        let viewController = QuizViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension QuizCoordinator: QuizViewModelCoordinatorDelegate {
    func optionTapped(shouldFinish: Bool) {
        delegate?.nextQuestionTapped(shouldFinish: shouldFinish)
    }    
}
