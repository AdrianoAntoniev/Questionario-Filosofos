//
//  ResultView.swift
//  Questionario-Filosofos
//
//  Created by Adriano Rodrigues Vieira on 15/07/21.
//

import UIKit
import Charts

// MARK: - class

class ResultView: UIView {    
    private let viewModel: ResultViewModel
    private lazy var resultLabel = buildLabel(withTitle: viewModel.result, andColor: .brown)
    private lazy var resultTitleLabel = buildLabel(withTitle: viewModel.resultLabelTitle, andColor: .green)
    private lazy var buttonStack = buildStack()
    private lazy var newGameButton = buildNewGameButton()
    private lazy var pieChart: PieChartView = buildPieChart()
    
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
        self.addSubview(pieChart)
        self.addSubview(buttonStack)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                pieChart.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                pieChart.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                pieChart.heightAnchor.constraint(equalToConstant: 230),
                pieChart.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
                
                buttonStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                buttonStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                buttonStack.heightAnchor.constraint(equalToConstant: 50),
                buttonStack.topAnchor.constraint(equalTo: pieChart.bottomAnchor, constant: 10),
                
                resultTitleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 30),
                resultTitleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -30),
                resultTitleLabel.heightAnchor.constraint(equalToConstant: 50),
                resultTitleLabel.bottomAnchor.constraint(equalTo: pieChart.topAnchor, constant: 10)
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
    
    func buildPieChart() -> PieChartView {
        let pieChart = PieChartView(frame: .zero)
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = false
        pieChart.isUserInteractionEnabled = false
        
        var entries: [PieChartDataEntry] = []
        entries.append(PieChartDataEntry(value: 100.0, label: "A"))
        entries.append(PieChartDataEntry(value: 50.0, label: "B"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "Zoo")
        
        dataSet.colors = UIColor.colors
        dataSet.drawValuesEnabled = false
        
        pieChart.data = PieChartData(dataSet: dataSet)
        
        return pieChart
    }
    
    @objc private func newGameTapped() {
        viewModel.newGameTapped()
    }        
}

// MARK: - Extension for UIColor

fileprivate extension UIColor {
    private static var colorOne: UIColor { .init(hex: 0x3A015C) }
    private static var colorTwo: UIColor { .init(hex: 0x4F0147) }
    private static var colorThree: UIColor { .init(hex: 0x35012C) }
    
    static let colors: [UIColor] = [
        colorOne, colorTwo, colorThree
    ]
    
    
    convenience init(red: Int, green: Int, blue: Int) {
        let safeRed = min(max(0, red), 255)
        let safeGreen = min(max(0, green), 255)
        let safeBlue = min(max(0, blue), 255)
        
        self.init(red: CGFloat(safeRed) / 255.0,
                  green: CGFloat(safeGreen) / 255.0,
                  blue: CGFloat(safeBlue) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
