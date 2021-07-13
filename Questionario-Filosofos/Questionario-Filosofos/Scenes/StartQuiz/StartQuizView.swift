//
//  StartQuizView.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 11/07/21.
//

import UIKit

class StartQuizView: UIView {
    private let viewModel: StartQuizViewModel
    
    private lazy var image: UIImageView = buildImage()
    private lazy var label: UILabel = buildLabel()
    private lazy var button: UIButton = buildButton()
    
    init(viewModel: StartQuizViewModel) {
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
        self.addSubview(image)
        self.addSubview(label)
        self.addSubview(button)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                image.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
                image.heightAnchor.constraint(equalToConstant: 200),
                image.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
                
                label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
                label.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
                
                button.heightAnchor.constraint(equalToConstant: 50),
                button.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -20),
                button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20)
            ]
        )
    }
}

// MARK: - Extension for build methods

extension StartQuizView {
    private func buildImage() -> UIImageView {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: viewModel.imageName)
        
        return image
    }
    
    private func buildLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel.labelTitle
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        
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
