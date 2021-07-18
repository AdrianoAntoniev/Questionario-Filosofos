//
//  ResultViewController.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import UIKit

class ResultViewController: UIViewController {
    private let resultView: ResultView
    
    init(viewModel: ResultViewModel) {
        self.resultView = ResultView(viewModel: viewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = resultView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideBackButton()
    }
}
