//
//  StartQuizCoordinator.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 12/07/21.
//

import UIKit

protocol StartQuizCoordinatorDelegate: AnyObject {
    func buttonTapped()
}

class StartQuizCoordinator: Coordinator {
    weak var delegate: StartQuizCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(
        navigationController: UINavigationController,
        delegate: StartQuizCoordinatorDelegate
        ) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    func start() {
        let viewData = StartQuizViewData(imageName: "mario.png",
                                         labelTitle: "Descubra seu perfil filosófico!",
                                         normalStateButtonTitle: "Iniciar!",
                                         highlightStateButtonTitle: "Aguarde...")
        
        let viewModel = StartQuizViewModel(viewData: viewData,
                                           delegate: self)
        let viewController = StartQuizViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }        
}

extension StartQuizCoordinator: StartQuizViewModelCoordinatorDelegate {
    func buttonTapped() {
        delegate?.buttonTapped()
    }
}
