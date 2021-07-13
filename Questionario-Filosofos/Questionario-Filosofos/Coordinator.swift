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
    var question = 0
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {        
        self.startWelcomeScreen()
    }
    
    func startWelcomeScreen() {
        let coordinator = StartQuizCoordinator(
            navigationController: navigationController,
            delegate: self
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func startQuiz(question: Int) {
        let coordinator = QuizCoordinator(
            navigationController: navigationController,
            question: question,
            delegate: self
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func startResults() {
        print("Calculando os resultados")
    }
}

// MARK: - StartQuizViewModelCoordinatorDelegate

extension MainCoordinator: StartQuizCoordinatorDelegate {
    func buttonTapped() {
        self.startQuiz(question: question)
    }    
}

// MARK: - QuizViewModelCoordinatorDelegate

extension MainCoordinator: QuizCoordinatorDelegate {
    func calculateResults() {
        self.startResults()
    }
    
    func nextQuestionTapped() {
        question += 1
        self.startQuiz(question: question)
    }
}
