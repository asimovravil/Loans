//
//  RequestSuccessViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit

class RequestSuccessViewController: UIViewController {
    
    let sosLabel = UILabel()
    let titleLabel = UILabel()
    let imageOnbo = UIImageView()
    let buttonOnbo = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonOnbo.layer.cornerRadius = 20
    }
}

extension RequestSuccessViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        sosLabel.text = "Ваша заявка на рассмотрении"
        sosLabel.textColor = .black
        sosLabel.font = UIFont(name: "Inter-SemiBold", size: 40)
        sosLabel.textAlignment = .center
        sosLabel.numberOfLines = 2
        sosLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sosLabel)
        
        titleLabel.text = "Мы свяжемся с Вами в ближайшее время для уточнения деталей займа"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        imageOnbo.image = UIImage(named: "requestsuccess")
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

extension RequestSuccessViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: sosLabel.bottomAnchor, constant: 24),
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
