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
    
    func startQuiz() {
        Questions.resetAnswers()
        let coordinator = QuizCoordinator(
            navigationController: navigationController,
            delegate: self
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func startResults() {
        let coordinator = ResultCoordinator(
            navigationController: navigationController,
            delegate: self
        )
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
}

// MARK: - StartQuizViewModelCoordinatorDelegate

extension MainCoordinator: StartQuizCoordinatorDelegate {
    func buttonTapped() {
        self.startQuiz()
    }    
}

// MARK: - QuizViewModelCoordinatorDelegate

extension MainCoordinator: QuizCoordinatorDelegate {
    func nextQuestionTapped(shouldFinish: Bool) {
        if shouldFinish {
            self.startResults()
        } else {
            self.startQuiz()
        }
    }
}
// MARK: - ResultCoordinatorDelegate

extension MainCoordinator: ResultCoordinatorDelegate {
    func newGame() {
        self.startQuiz()
    }        
}
