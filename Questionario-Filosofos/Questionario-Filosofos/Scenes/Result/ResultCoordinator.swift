//
//  ResultCoordinator.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import UIKit

protocol ResultCoordinatorDelegate: AnyObject {
    func newGame()
    func finish()
}

class ResultCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var delegate: ResultCoordinatorDelegate?

    init(
            navigationController: UINavigationController,
            delegate: ResultCoordinatorDelegate
        ) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    func start() {
        let viewModel = ResultViewModel(
            viewData: .init(),
            delegate: self
        )
        let viewController = ResultViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }        
}

// MARK: - Extension for ResultViewModelCoordinatorDelegate

extension ResultCoordinator: ResultViewModelCoordinatorDelegate {
    func finishGame() {
        delegate?.finish()
    }
    
    func newGame() {
        delegate?.newGame()
    }    
}
