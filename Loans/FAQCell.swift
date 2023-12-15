//
//  FAQCell.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class FAQCell: UITableViewCell {

    static let reuseID = String(describing: FAQCell.self)
    
    let labelQuestion = UILabel()
    let labelAnswer = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FAQCell {
    private func setupUI() {
        labelQuestion.text = "50 000 ₽"
        labelQuestion.textColor = .black
        labelQuestion.font = UIFont(name: "Inter-Regular", size: 18)
        labelQuestion.textAlignment = .center
        labelQuestion.numberOfLines = 0
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelQuestion)
        
        labelAnswer.text = "На рассмотрении 09.12.2023"
        labelAnswer.textColor = .black
        labelAnswer.font = UIFont(name: "Inter-Regular", size: 16)
        labelAnswer.textAlignment = .left
        labelAnswer.numberOfLines = 0
        labelAnswer.alpha = 0.50
        labelAnswer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelAnswer)
    }
    
    func configure(with data: CellData) {
        labelQuestion.text = data.question
        labelAnswer.text = data.answer
        labelAnswer.isHidden = !data.isExpanded
    }
}

extension FAQCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelQuestion.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelQuestion.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            labelAnswer.topAnchor.constraint(equalTo: labelQuestion.bottomAnchor, constant: 8),
            labelAnswer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelAnswer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
