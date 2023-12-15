//
//  HistoryCell.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class HistoryCell: UITableViewCell {

    static let reuseID = String(describing: HistoryCell.self)
    
    let labelAmount = UILabel()
    let lineAmount = UIView()
    let descAmount = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryCell {
    private func setupUI() {
        labelAmount.text = "50 000 ₽"
        labelAmount.textColor = .black
        labelAmount.font = UIFont(name: "Inter-Regular", size: 18)
        labelAmount.textAlignment = .center
        labelAmount.numberOfLines = 0
        labelAmount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelAmount)
        
        lineAmount.backgroundColor = .lightGray
        lineAmount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineAmount)
        
        descAmount.text = "На рассмотрении 09.12.2023"
        descAmount.textColor = .black
        descAmount.font = UIFont(name: "Inter-Regular", size: 16)
        descAmount.textAlignment = .left
        descAmount.numberOfLines = 0
        descAmount.alpha = 0.50
        descAmount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descAmount)
    }
}

extension HistoryCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelAmount.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            lineAmount.topAnchor.constraint(equalTo: labelAmount.bottomAnchor, constant: 12),
            lineAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lineAmount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lineAmount.heightAnchor.constraint(equalToConstant: 0.5),
            
            descAmount.topAnchor.constraint(equalTo: lineAmount.bottomAnchor, constant: 8),
            descAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
    }
}
