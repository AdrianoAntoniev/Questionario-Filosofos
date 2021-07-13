//
//  QuizView.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 12/07/21.
//

import UIKit

class QuizView: UIView {
    private let viewModel: QuizViewModel
        
    private lazy var stackView: UIStackView = buildStackView()
    private lazy var questionLabel: UILabel = buildLabel(withTitle: viewModel.questionTitle,
                                                 fontSize: 30)
    private lazy var choiceOne = buildLabel(withTitle: viewModel.choiceOne, alignment: .left)
    private lazy var choiceTwo = buildLabel(withTitle: viewModel.choiceTwo, alignment: .left)
    private lazy var choiceThree = buildLabel(withTitle: viewModel.choiceThree, alignment: .left)
    private lazy var choiceFour = buildLabel(withTitle: viewModel.choiceFour, alignment: .left)
    
    private lazy var button: UIButton = buildButton()
    
    init(viewModel: QuizViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
                
        self.backgroundColor = .orange
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Ouch man!")
    }
    
    private func setup() {
        addItems()
        configureConstraints()
    }
    
    private func addItems() {
        self.addSubview(questionLabel)
        self.addSubview(stackView)
        self.addSubview(button)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                questionLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
                questionLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
                questionLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
                
                stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
                
                button.heightAnchor.constraint(equalToConstant: 50),
                button.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -20),
                button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
                
                choiceOne.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
                choiceOne.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
                choiceOne.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
                
                choiceTwo.topAnchor.constraint(equalTo: choiceOne.bottomAnchor, constant: 10),
                choiceTwo.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
                choiceTwo.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
                
                choiceThree.topAnchor.constraint(equalTo: choiceTwo.bottomAnchor, constant: 10),
                choiceThree.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
                choiceThree.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
                
                choiceFour.topAnchor.constraint(equalTo: choiceThree.bottomAnchor, constant: 10),
                choiceFour.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
                choiceFour.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
                choiceFour.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10)
            ]
        )
    }
}

// MARK: - Extension for build methods

extension QuizView {
    private func buildStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [choiceOne, choiceTwo, choiceThree, choiceFour])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }
    
    private func buildLabel(withTitle title: String,
                            fontSize: CGFloat = 20,
                            alignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = .boldSystemFont(ofSize: fontSize)
        label.numberOfLines = 0
        label.textAlignment = alignment
        
        return label
    }
    
    private func buildButton() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(viewModel.normalStateButtonTitle, for: .normal)
        button.setTitle(viewModel.highlightStateButtonTitle, for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }
    
    @objc func buttonTapped() {
        viewModel.buttonTapped()
    }
}
