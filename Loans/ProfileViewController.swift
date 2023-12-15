//
//  ProfileViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

class ProfileViewController: UIViewController {
    
    let profileLabel = UILabel()
    let lastNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let firstNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let middleNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let phoneField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonLeaveAccount = UIButton(type: .system)
    let buttonDeleteAccount = UIButton(type: .system)
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
        
        buttonLeaveAccount.layer.cornerRadius = 20
        buttonDeleteAccount.layer.cornerRadius = 20
    }
    
    @objc private func dismissKeyboard() {
        lastNameField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        middleNameField.resignFirstResponder()
        phoneField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension ProfileViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        profileLabel.text = "Профиль"
        profileLabel.textColor = .black
        profileLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        profileLabel.textAlignment = .center
        profileLabel.numberOfLines = 0
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLabel)
        
        buttonLeaveAccount.setTitle("Выйти из аккаунта", for: .normal)
        buttonLeaveAccount.setTitleColor(.white, for: .normal)
        buttonLeaveAccount.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonLeaveAccount.backgroundColor = .black
        buttonLeaveAccount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLeaveAccount)
        
        buttonDeleteAccount.setTitle("Удалить аккаунт", for: .normal)
        buttonDeleteAccount.setTitleColor(AppColor.redCustom.uiColor, for: .normal)
        buttonDeleteAccount.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonDeleteAccount.backgroundColor = AppColor.redLightCustom.uiColor
        buttonDeleteAccount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonDeleteAccount)
        
        lastNameField.placeholder = "Иванов"
        lastNameField.title = "Фамилия"
        lastNameField.font = UIFont(name: "Inter-Regular", size: 18)
        lastNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        lastNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lastNameField)
        
        firstNameField.placeholder = "Иван"
        firstNameField.title = "Имя"
        firstNameField.font = UIFont(name: "Inter-Regular", size: 18)
        firstNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        firstNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        firstNameField.textContentType = .none
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNameField)
        
        middleNameField.placeholder = "Иванович"
        middleNameField.title = "Отчество"
        middleNameField.font = UIFont(name: "Inter-Regular", size: 18)
        middleNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        middleNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        middleNameField.textContentType = .none
        middleNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(middleNameField)
        
        phoneField.placeholder = "+7 (999) 123 45 67"
        phoneField.title = "Телефон"
        phoneField.font = UIFont(name: "Inter-Regular", size: 18)
        phoneField.selectedLineColor = AppColor.yellowCustom.uiColor
        phoneField.selectedTitleColor = AppColor.yellowCustom.uiColor
        phoneField.textContentType = .none
        phoneField.keyboardType = .phonePad
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneField)
    }
}

extension ProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lastNameField.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 40),
            lastNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lastNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            firstNameField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 32),
            firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            middleNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 32),
            middleNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneField.topAnchor.constraint(equalTo: middleNameField.bottomAnchor, constant: 32),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonLeaveAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonLeaveAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonLeaveAccount.bottomAnchor.constraint(equalTo: buttonDeleteAccount.topAnchor, constant: -24),
            buttonLeaveAccount.heightAnchor.constraint(equalToConstant: 56),
            
            buttonDeleteAccount
                .leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonDeleteAccount
                .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonDeleteAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
            buttonDeleteAccount.heightAnchor.constraint(equalToConstant: 56),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                
            ])
        } else {
            NSLayoutConstraint.activate([
                
            ])
        }
    }
}
