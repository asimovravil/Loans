//
//  CreditsWhiteCell.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class CreditsWhiteCell: UITableViewCell {
    
    static let reuseID = String(describing: CreditsWhiteCell.self)
    
    let logoImage = UIImageView()
    let amountLabel = UILabel()
    let percentLabel = UILabel()
    let webLoansLabel = UILabel()
    let starLabel = UILabel()
    let starImage = UIImageView()
    let lineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreditsWhiteCell {
    private func setupUI() {
        logoImage.image = UIImage(named: "logo")
        logoImage.layer.masksToBounds = true
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.layer.cornerRadius = 25
        contentView.addSubview(logoImage)
        
        amountLabel.text = "До 30 000 ₽"
        amountLabel.textColor = .black
        amountLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        amountLabel.textAlignment = .center
        amountLabel.numberOfLines = 0
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountLabel)
                
        percentLabel.text = "1 год без %"
        percentLabel.textColor = .black
        percentLabel.font = UIFont(name: "Inter-Medium", size: 16)
        percentLabel.textAlignment = .center
        percentLabel.numberOfLines = 0
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(percentLabel)
        
        webLoansLabel.text = "Вебзайм"
        webLoansLabel.textColor = .black
        webLoansLabel.font = UIFont(name: "Inter-Regular", size: 14)
        webLoansLabel.textAlignment = .center
        webLoansLabel.alpha = 0.50
        webLoansLabel.numberOfLines = 0
        webLoansLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(webLoansLabel)
        
        starLabel.text = "5.0"
        starLabel.textColor = .black
        starLabel.font = UIFont(name: "Inter-SemiBold", size: 18)
        starLabel.textAlignment = .center
        starLabel.numberOfLines = 0
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starLabel)
        
        starImage.image = UIImage(named: "star")
        starImage.layer.masksToBounds = true
        starImage.contentMode = .scaleAspectFill
        starImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(starImage)
        
        lineView.backgroundColor = .lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lineView)
    }
}

extension CreditsWhiteCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 50),
            logoImage.widthAnchor.constraint(equalToConstant: 50),
            
            amountLabel.topAnchor.constraint(equalTo: logoImage.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 16),
            
            percentLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 4),
            percentLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 16),
            
            webLoansLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 4),
            webLoansLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 16),
            
            starLabel.topAnchor.constraint(equalTo: logoImage.topAnchor),
            starLabel.trailingAnchor.constraint(equalTo: starImage.leadingAnchor, constant: -4),
            
            starImage.topAnchor.constraint(equalTo: logoImage.topAnchor),
            starImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            lineView.topAnchor.constraint(equalTo: webLoansLabel.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
        ])
    }
}

extension CreditsWhiteCell {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.logoImage.image = image
                }
            }
        }.resume()
    }
}
