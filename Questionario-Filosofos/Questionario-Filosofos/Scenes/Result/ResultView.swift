//
//  ResultView.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import UIKit

// MARK: - class

class ResultView: UIView {    
    private let viewModel: ResultViewModel
    private lazy var resultLabel = buildLabel(withTitle: viewModel.result, andColor: .brown)
    private lazy var resultTitleLabel = buildLabel(withTitle: viewModel.resultLabelTitle, andColor: .green)
    private lazy var buttonStack = buildStack()
    private lazy var newGameButton = buildNewGameButton()
    
    init(viewModel: ResultViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        self.backgroundColor = .orange
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addItems()
        configureConstraints()
    }
    
    private func addItems() {
        self.addSubview(resultTitleLabel)
        self.addSubview(resultLabel)
        self.addSubview(buttonStack)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                resultLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                resultLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                resultLabel.heightAnchor.constraint(equalToConstant: 120),
                resultLabel.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
                
                buttonStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                buttonStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                buttonStack.heightAnchor.constraint(equalToConstant: 50),
                buttonStack.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
                
                resultTitleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                resultTitleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                resultTitleLabel.heightAnchor.constraint(equalToConstant: 50),
                resultTitleLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor, constant: 10)
            ]
        )
    }

    private func buildLabel(withTitle title: String, andColor color: UIColor) -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = color
        
        return label
    }
    
    func buildNewGameButton() -> UIButton {
        let button = buildButton(withTitle: viewModel.newGameButtonTitle)
        button.addTarget(self, action: #selector(newGameTapped), for: .touchUpInside)
        
        return button
    }
    
    private func buildButton(withTitle title: String) -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)

        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        
        button.backgroundColor = .blue
        
        return button
    }
    
    private func buildStack() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [newGameButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }
    
    @objc private func newGameTapped() {
        viewModel.newGameTapped()
    }        
}
