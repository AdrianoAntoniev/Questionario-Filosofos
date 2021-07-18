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
    private lazy var questionLabel: UILabel = buildLabel(withTitle: viewModel.question.title,
                                                 fontSize: 30)
    private lazy var choiceOne = buildLabelOne(withTitle: viewModel.question.one.title, alignment: .left)
    private lazy var choiceTwo = buildLabelTwo(withTitle: viewModel.question.two.title, alignment: .left)
    private lazy var choiceThree = buildLabelThree(withTitle: viewModel.question.three.title, alignment: .left)
    private lazy var choiceFour = buildLabelFour(withTitle: viewModel.question.four.title, alignment: .left)
    
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
                stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -20),
                                
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
    
    private func buildLabelOne(withTitle title: String, alignment: NSTextAlignment) -> UILabel {
        let label = buildLabel(withTitle: title, alignment: alignment, andTag: 0)
        
        return label
    }
    
    private func buildLabelTwo(withTitle title: String, alignment: NSTextAlignment) -> UILabel {
        let label = buildLabel(withTitle: title, alignment: alignment, andTag: 1)
        
        return label
    }
    
    private func buildLabelThree(withTitle title: String, alignment: NSTextAlignment) -> UILabel {
        let label = buildLabel(withTitle: title, alignment: alignment, andTag: 2)
        
        return label
    }
    
    private func buildLabelFour(withTitle title: String, alignment: NSTextAlignment) -> UILabel {
        let label = buildLabel(withTitle: title, alignment: alignment, andTag: 3)
        
        return label
    }
    
    private func buildLabel(withTitle title: String,
                            fontSize: CGFloat = 20,
                            alignment: NSTextAlignment = .center,
                            andTag tag: Int? = nil) -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = .boldSystemFont(ofSize: fontSize)
        label.numberOfLines = 0
        label.textAlignment = alignment
        
        if let safeTag = tag {
            label.tag = safeTag
        }
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelTap)
        
        return label
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        
        viewModel.optionTapped(tag)
    }
}
