//
//  StartQuizViewController.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import UIKit

class StartQuizViewController: UIViewController {    
    private let startQuizView: StartQuizView!
    
    init(viewModel: StartQuizViewModel) {
        self.startQuizView = StartQuizView(viewModel: viewModel)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideBackButton()
    }
}
