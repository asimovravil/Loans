//
//  AmountViewController.swift
//  Loans
//
//  Created by Ravil on 14.12.2023.
//

import UIKit

protocol LoanRequestDelegate: AnyObject {
    func didReceiveNewLoanRequest(amount: String, date: String)
}

class AmountViewController: UIViewController {

    let amountLabel = UILabel()
    let loansAmount = UIImageView()
    let loansField = UITextField()
    let amountSubLabel = UILabel()
    let amountButtonRequest = UIButton(type: .system)
    let privacyLabel = UILabel()
    let wrongLabel = UILabel()
    
    weak var delegate: LoanRequestDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loansField.layer.cornerRadius = 20
        amountButtonRequest.layer.cornerRadius = 20
    }
    
    @objc private func dismissKeyboard() {
        loansField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension AmountViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        amountLabel.text = "Займы онлайн"
        amountLabel.textColor = .black
        amountLabel.font = UIFont(name: "Inter-SemiBold", size: 40)
        amountLabel.textAlignment = .center
        amountLabel.numberOfLines = 0
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountLabel)
        
        loansAmount.image = UIImage(named: "loansAmount")
        loansAmount.layer.masksToBounds = true
        loansAmount.contentMode = .scaleAspectFill
        loansAmount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loansAmount)
        
        loansField.placeholder = "100 000 ₽"
        loansField.font = UIFont(name: "Inter-SemiBold", size: 40)
        loansField.textAlignment = .center
        loansField.textColor = .black
        loansField.keyboardType = .numberPad
        loansField.backgroundColor = AppColor.yellowLightCustom.uiColor
        loansField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loansField)
        
        amountSubLabel.text = "Сумма займа"
        amountSubLabel.textColor = .black
        amountSubLabel.font = UIFont(name: "Inter-Regular", size: 16)
        amountSubLabel.alpha = 0.50
        amountSubLabel.textAlignment = .center
        amountSubLabel.numberOfLines = 0
        amountSubLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountSubLabel)
        
        amountButtonRequest.setTitle("Подать заявку", for: .normal)
        amountButtonRequest.setTitleColor(.black, for: .normal)
        amountButtonRequest.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        amountButtonRequest.backgroundColor = AppColor.yellowCustom.uiColor
        amountButtonRequest.translatesAutoresizingMaskIntoConstraints = false
        amountButtonRequest.addTarget(self, action: #selector(amountButtonRequestMeta), for: .touchUpInside)
        view.addSubview(amountButtonRequest)
        
        let privacyText = "Нажимая кнопку вы соглашаетесь с\nправилами выдачи займов"
        let attributedText = NSMutableAttributedString(string: privacyText, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Inter-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14),
        ])
        
        let yellowColor = AppColor.yellowCustom.uiColor
        let underlineRange = (attributedText.string as NSString).range(of: "правилами выдачи займов")
        attributedText.addAttributes([
            .foregroundColor: yellowColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ], range: underlineRange)
        
        privacyLabel.attributedText = attributedText
        privacyLabel.textAlignment = .center
        privacyLabel.numberOfLines = 2
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privacyLabel)
        
        wrongLabel.text = "*Введите сумму от 5 000 ₽ до 5 000 000 ₽"
        wrongLabel.textColor = AppColor.redCustom.uiColor
        wrongLabel.font = UIFont(name: "Inter-Regular", size: 16)
        wrongLabel.textAlignment = .center
        wrongLabel.numberOfLines = 0
        wrongLabel.isHidden = true
        wrongLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrongLabel)
    }
    
    @objc func amountButtonRequestMeta() {
        guard let amountText = loansField.text?.replacingOccurrences(of: " ₽", with: ""),
              let amount = Int(amountText),
              amount >= 5000, amount <= 5000000 else {
            wrongLabel.isHidden = false
            return
        }

        wrongLabel.isHidden = true
        amountButtonRequest.isEnabled = true

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: Date())

        delegate?.didReceiveNewLoanRequest(amount: "\(amount) ₽", date: currentDate)

        navigateBasedOnUserLoggedInStatus()
    }

    private func navigateBasedOnUserLoggedInStatus() {
        let isUserLoggedIn = UserDefaults.standard.string(forKey: "userEmail") != nil && UserDefaults.standard.string(forKey: "userPassword") != nil

        if self.tabBarController == nil {
            let nextViewController = isUserLoggedIn ? TabBarViewController() : RegistrationViewController()
            nextViewController.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

extension AmountViewController {
    private func setupConstraints() {
        if self.tabBarController != nil {
            setupConstraintsWithTabBar()
        } else {
            setupConstraintsWithoutTabBar()
        }
    }
    
    private func setupConstraintsWithTabBar() {
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            loansAmount.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: -12),
            loansAmount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            
            loansField.topAnchor.constraint(equalTo: loansAmount.bottomAnchor, constant: 6),
            loansField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loansField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loansField.heightAnchor.constraint(equalToConstant: 80),
            
            amountSubLabel.topAnchor.constraint(equalTo: loansField.bottomAnchor, constant: 8),
            amountSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            amountButtonRequest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            amountButtonRequest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            amountButtonRequest.bottomAnchor.constraint(equalTo: privacyLabel.topAnchor, constant: -24),
            amountButtonRequest.heightAnchor.constraint(equalToConstant: 56),
            
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            privacyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            wrongLabel.topAnchor.constraint(equalTo: amountSubLabel.bottomAnchor, constant: 8),
            wrongLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            wrongLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                amountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115),
                loansAmount.heightAnchor.constraint(equalToConstant: 392),
            ])
        } else {
            NSLayoutConstraint.activate([
                amountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
                loansAmount.heightAnchor.constraint(equalToConstant: 332),
            ])
        }
    }
    
    private func setupConstraintsWithoutTabBar() {
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            loansAmount.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: -12),
            loansAmount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            
            loansField.topAnchor.constraint(equalTo: loansAmount.bottomAnchor, constant: 6),
            loansField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loansField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loansField.heightAnchor.constraint(equalToConstant: 80),
            
            amountSubLabel.topAnchor.constraint(equalTo: loansField.bottomAnchor, constant: 8),
            amountSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            amountButtonRequest.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            amountButtonRequest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            amountButtonRequest.bottomAnchor.constraint(equalTo: privacyLabel.topAnchor, constant: -24),
            amountButtonRequest.heightAnchor.constraint(equalToConstant: 56),
            
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            privacyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            wrongLabel.topAnchor.constraint(equalTo: amountSubLabel.bottomAnchor, constant: 8),
            wrongLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                amountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            ])
        } else {
            NSLayoutConstraint.activate([
                amountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
}
