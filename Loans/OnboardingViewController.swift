//
//  ViewController.swift
//  Loans
//
//  Created by Ravil on 14.12.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let sosLabel = UILabel()
    let moneyCard = UIView()
    let moneyLabel = UILabel()
    let titleLabel = UILabel()
    let imageOnbo = UIImageView()
    let buttonOnbo = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        moneyCard.layer.cornerRadius = 23
        buttonOnbo.layer.cornerRadius = 20
    }
}

extension OnboardingViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        sosLabel.text = "Срочно понадобились"
        sosLabel.textColor = .black
        sosLabel.font = UIFont(name: "Inter-SemiBold", size: 40)
        sosLabel.textAlignment = .center
        sosLabel.numberOfLines = 2
        sosLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sosLabel)
        
        moneyCard.backgroundColor = AppColor.yellowCustom.uiColor
        moneyCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moneyCard)
        
        moneyLabel.text = "деньги?"
        moneyLabel.textColor = .black
        moneyLabel.font = UIFont(name: "Inter-SemiBold", size: 40)
        moneyLabel.textAlignment = .center
        moneyLabel.numberOfLines = 0
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moneyLabel)
        
        titleLabel.text = "Оформите первый займ на сумму до 5 000 000 рублей без процентов"
        
        let attributedText = NSMutableAttributedString(string: titleLabel.text ?? "", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Inter-Regular", size: 20) ?? UIFont.systemFont(ofSize: 20),
        ])
        
        let boldFont = UIFont(name: "Inter-Bold", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        let boldRange = (attributedText.string as NSString).range(of: "без процентов")
        attributedText.addAttributes([.font: boldFont], range: boldRange)
        
        titleLabel.attributedText = attributedText
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        imageOnbo.image = UIImage(named: "imageOnbo")
        imageOnbo.layer.masksToBounds = true
        imageOnbo.contentMode = .scaleAspectFill
        imageOnbo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageOnbo)
        
        buttonOnbo.setTitle("Продолжить", for: .normal)
        buttonOnbo.setTitleColor(.black, for: .normal)
        buttonOnbo.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonOnbo.backgroundColor = AppColor.yellowCustom.uiColor
        buttonOnbo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonOnbo)
    }
    
    @objc func buttonOnboMeta() {
        let amountVC = AmountViewController()
        amountVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(amountVC, animated: true)
    }
}

extension OnboardingViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            moneyCard.topAnchor.constraint(equalTo: sosLabel.bottomAnchor, constant: 8),
            moneyCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            moneyCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            moneyCard.heightAnchor.constraint(equalToConstant: 61),
            
            moneyLabel.centerXAnchor.constraint(equalTo: moneyCard.centerXAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: moneyCard.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: moneyCard.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageOnbo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonOnbo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonOnbo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonOnbo.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                sosLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                buttonOnbo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
                imageOnbo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
            ])
        } else {
            NSLayoutConstraint.activate([
                sosLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                buttonOnbo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
                imageOnbo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            ])
        }
    }
}
