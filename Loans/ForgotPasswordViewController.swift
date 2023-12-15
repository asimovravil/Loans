//
//  ForgotPasswordViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

class ForgotPasswordViewController: UIViewController {

    let forgotLabel = UILabel()
    let emailField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonForgotPassword = UIButton(type: .system)
    let faqLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonForgotPassword.layer.cornerRadius = 20
    }
    
    @objc private func dismissKeyboard() {
        emailField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension ForgotPasswordViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        forgotLabel.text = "Восстановление пароля"
        forgotLabel.textColor = .black
        forgotLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        forgotLabel.textAlignment = .center
        forgotLabel.numberOfLines = 0
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotLabel)
        
        buttonForgotPassword.setTitle("Восстановить пароль", for: .normal)
        buttonForgotPassword.setTitleColor(.black, for: .normal)
        buttonForgotPassword.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonForgotPassword.backgroundColor = AppColor.yellowCustom.uiColor
        buttonForgotPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonForgotPassword)
        
        emailField.placeholder = "example@gmail.com"
        emailField.title = "Почта"
        emailField.font = UIFont(name: "Inter-Regular", size: 18)
        emailField.selectedLineColor = AppColor.yellowCustom.uiColor
        emailField.selectedTitleColor = AppColor.yellowCustom.uiColor
        emailField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailField)
        
        faqLabel.text = "*На указанную электронную почту будет отправлено сообщение с инструкцией по восстановлению пароля"
        faqLabel.textColor = .black
        faqLabel.font = UIFont(name: "Inter-Regular", size: 16)
        faqLabel.textAlignment = .left
        faqLabel.numberOfLines = 0
        faqLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(faqLabel)
    }
}

extension ForgotPasswordViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            forgotLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonForgotPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonForgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonForgotPassword.heightAnchor.constraint(equalToConstant: 56),
            
            faqLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            faqLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            faqLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonForgotPassword.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonForgotPassword.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
}
