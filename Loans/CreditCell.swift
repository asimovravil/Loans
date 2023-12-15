//
//  CreditCell.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class CreditCell: UICollectionViewCell {
    
    static let reuseID = String(describing: CreditCell.self)
    
    let creditCard = UIView()
    let bestImage = UIImageView()
    let amountLabel = UILabel()
    let webLoansLabel = UILabel()
    let starImage = UIImageView()
    let logoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreditCell {
    private func setupUI() {
        creditCard.backgroundColor = AppColor.yellowCustom.uiColor
        creditCard.layer.cornerRadius = 20
        creditCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(creditCard)
        
        bestImage.image = UIImage(named: "best")
        bestImage.layer.masksToBounds = true
        bestImage.contentMode = .scaleAspectFill
        bestImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bestImage)
        
        amountLabel.text = "До 30 000 ₽"
        amountLabel.textColor = .black
        amountLabel.font = UIFont(name: "Inter-SemiBold", size: 24)
        amountLabel.textAlignment = .center
        amountLabel.numberOfLines = 0
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountLabel)
        
        webLoansLabel.text = "Вебзайм"
        webLoansLabel.textColor = .black
        webLoansLabel.font = UIFont(name: "Inter-Regular", size: 14)
        webLoansLabel.textAlignment = .center
        webLoansLabel.numberOfLines = 0
        webLoansLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(webLoansLabel)
        
        starImage.image = UIImage(named: "stars")
        starImage.layer.masksToBounds = true
        starImage.contentMode = .scaleAspectFill
        starImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starImage)
        
        logoImage.image = UIImage(named: "logo")
        logoImage.layer.masksToBounds = true
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoImage)
    }
}

extension CreditCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            creditCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            creditCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            creditCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            creditCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            bestImage.topAnchor.constraint(equalTo: creditCard.topAnchor, constant: 16),
            bestImage.leadingAnchor.constraint(equalTo: creditCard.leadingAnchor, constant: 16),
            
            amountLabel.topAnchor.constraint(equalTo: bestImage.bottomAnchor, constant: 8),
            amountLabel.leadingAnchor.constraint(equalTo: creditCard.leadingAnchor, constant: 16),
            
            webLoansLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
            webLoansLabel.leadingAnchor.constraint(equalTo: creditCard.leadingAnchor, constant: 16),
            
            starImage.topAnchor.constraint(equalTo: webLoansLabel.bottomAnchor, constant: 16),
            starImage.leadingAnchor.constraint(equalTo: creditCard.leadingAnchor, constant: 16),

            logoImage.trailingAnchor.constraint(equalTo: creditCard.trailingAnchor, constant: -16),
            logoImage.bottomAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: -16),
        ])
    }
}
