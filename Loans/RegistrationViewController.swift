//
//  RegistrationViewController.swift
//  Loans
//
//  Created by Ravil on 14.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

class RegistrationViewController: UIViewController {

    let registerLabel = UILabel()
    let emailField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let passwordField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonRegister = UIButton()
    let buttonLogin = UIButton()
    let passwordVisibilityToggle = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonRegister.layer.cornerRadius = 20
        buttonLogin.layer.cornerRadius = 20
    }
    
    @objc private func dismissKeyboard() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension RegistrationViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        registerLabel.text = "Регистрация"
        registerLabel.textColor = .black
        registerLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        registerLabel.textAlignment = .center
        registerLabel.numberOfLines = 0
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerLabel)
        
        buttonRegister.setTitle("Регистрация", for: .normal)
        buttonRegister.setTitleColor(.black, for: .normal)
        buttonRegister.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonRegister.backgroundColor = AppColor.yellowCustom.uiColor
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonRegister)
        
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonLogin.backgroundColor = AppColor.yellowLightCustom.uiColor
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLogin)
        
        emailField.placeholder = "example@gmail.com"
        emailField.title = "Почта"
        emailField.font = UIFont(name: "Inter-Regular", size: 18)
        emailField.selectedLineColor = AppColor.yellowCustom.uiColor
        emailField.selectedTitleColor = AppColor.yellowCustom.uiColor
        emailField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailField)
        
        passwordField.placeholder = "Пароль"
        passwordField.title = "Пароль"
        passwordField.font = UIFont(name: "Inter-Regular", size: 18)
        passwordField.selectedLineColor = AppColor.yellowCustom.uiColor
        passwordField.selectedTitleColor = AppColor.yellowCustom.uiColor
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .none
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordField)
        
        let eyeImage = UIImage(named: "eye")
        passwordVisibilityToggle.setImage(eyeImage, for: .normal)
        passwordVisibilityToggle.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        passwordVisibilityToggle.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        passwordField.rightView = passwordVisibilityToggle
        passwordField.rightViewMode = .always
    }
    
    @objc private func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        let eyeImageName = passwordField.isSecureTextEntry ? "eye" : "eyeSelected"
        let eyeImage = UIImage(named: eyeImageName)
        passwordVisibilityToggle.setImage(eyeImage, for: .normal)
    }

}

extension RegistrationViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonRegister.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 56),
            
            buttonLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonLogin.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonLogin.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonLogin.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
}
