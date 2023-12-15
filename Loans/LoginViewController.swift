//
//  LoginViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    let loginLabel = UILabel()
    let emailField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let passwordField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonLogin = UIButton(type: .system)
    let buttonRegister = UIButton(type: .system)
    let buttonForgot = UIButton(type: .system)
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
        
        buttonLogin.layer.cornerRadius = 20
        buttonRegister.layer.cornerRadius = 20
    }
    
    @objc private func dismissKeyboard() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension LoginViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        loginLabel.text = "Добро пожаловать!"
        loginLabel.textColor = .black
        loginLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        loginLabel.textAlignment = .center
        loginLabel.numberOfLines = 0
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        
        buttonLogin.setTitle("Войти", for: .normal)
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonLogin.backgroundColor = AppColor.yellowCustom.uiColor
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.addTarget(self, action: #selector(buttonLoginMeta), for: .touchUpInside)
        view.addSubview(buttonLogin)
        
        buttonRegister.setTitle("Регистрация", for: .normal)
        buttonRegister.setTitleColor(.black, for: .normal)
        buttonRegister.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonRegister.backgroundColor = AppColor.yellowLightCustom.uiColor
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.addTarget(self, action: #selector(buttonRegisterMeta), for: .touchUpInside)
        view.addSubview(buttonRegister)
        
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
        
        buttonForgot.setTitle("Забыли пароль?", for: .normal)
        buttonForgot.setTitleColor(AppColor.yellowCustom.uiColor, for: .normal)
        buttonForgot.titleLabel?.font = UIFont(name: "Inter-Regular", size: 16)
        buttonForgot.translatesAutoresizingMaskIntoConstraints = false
        buttonForgot.addTarget(self, action: #selector(buttonForgotMeta), for: .touchUpInside)
        view.addSubview(buttonForgot)
        
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

    @objc func buttonLoginMeta() {
        let savedEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword") ?? ""

        if emailField.text == savedEmail && passwordField.text == savedPassword {
            let tabbarVC = TabBarViewController()
            tabbarVC.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(tabbarVC, animated: true)
        } else {
            print("Неверные учетные данные")
        }
    }

    @objc func buttonRegisterMeta() {
        let registerVC = RegistrationViewController()
        registerVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func buttonForgotMeta() {
        let forgotVC = ForgotPasswordViewController()
        forgotVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(forgotVC, animated: true)
    }
}

extension LoginViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonLogin.bottomAnchor.constraint(equalTo: buttonRegister.topAnchor, constant: -24),
            buttonLogin.heightAnchor.constraint(equalToConstant: 56),
            
            buttonRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonRegister.heightAnchor.constraint(equalToConstant: 56),
            
            buttonForgot.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            buttonForgot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                buttonRegister.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -68),
            ])
        } else {
            NSLayoutConstraint.activate([
                loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                buttonRegister.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
}
