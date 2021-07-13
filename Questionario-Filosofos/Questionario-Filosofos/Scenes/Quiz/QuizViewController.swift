//
//  QuizViewController.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 12/07/21.
//

import UIKit

class QuizViewController: UIViewController {
    private let quizView: QuizView!
    
    init(viewModel: QuizViewModel) {
        self.quizView = QuizView(viewModel: viewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = quizView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
