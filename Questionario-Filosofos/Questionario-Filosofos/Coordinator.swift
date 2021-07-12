//
//  Coordinator.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import UIKit

// MARK: - Protocol

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start()
}

// MARK: - Class

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {        
        let viewController = StartQuizViewController(coordinator: self)        
        self.navigationController.pushViewController(viewController, animated: true)        
    }
}


