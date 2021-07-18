//
//  ResultView.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import UIKit

// MARK: - class

class ResultView: UIView {
    
    // MARK: - enum
    
    private let viewModel: ResultViewModel
    private lazy var label = buildLabel()
    private lazy var buttonStack = buildStack()
    private lazy var newGameButton = buildNewGameButton()
    private lazy var exitButton = buildExitButton()
    
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
        self.addSubview(label)
        self.addSubview(buttonStack)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                label.heightAnchor.constraint(equalToConstant: 80),
                label.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
                
                buttonStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                buttonStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                buttonStack.heightAnchor.constraint(equalToConstant: 50),
                buttonStack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
            ]
        )
    }

    private func buildLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Parabéns!!!!"
        label.textAlignment = .center
        label.backgroundColor = .brown
        
        return label
    }
    
    func buildNewGameButton() -> UIButton {
        let button = buildButton(withTitle: "Novo Jogo")
        button.addTarget(self, action: #selector(newGameTapped), for: .touchUpInside)
        
        return button
    }
    
    func buildExitButton() -> UIButton {
        let button = buildButton(withTitle: "Sair")
        button.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        
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
        let stack = UIStackView(arrangedSubviews: [newGameButton, exitButton])
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
    
    @objc private func exitTapped() {
        viewModel.exitTapped()
    }
}
