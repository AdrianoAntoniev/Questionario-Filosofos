//
//  StartQuizViewController.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import UIKit

class StartQuizViewController: UIViewController {
    private weak var coordinator: MainCoordinator?
    private let startQuizView: StartQuizView!
    
    init(coordinator: MainCoordinator) {
        self.startQuizView = StartQuizView()
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = startQuizView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
