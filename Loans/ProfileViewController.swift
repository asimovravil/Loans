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
    let buttonSaveAccount = UIButton(type: .system)
    let passwordVisibilityToggle = UIButton(type: .custom)
    let buttonEdit = UIButton(type: .custom)
    let buttonLeft = UIButton(type: .custom)
    let popUpLeave = UIView()
    let popUpButtonLeave = UIButton(type: .system)
    let popUpButtonCancel = UIButton(type: .system)
    let popUpButtonDelete = UIButton(type: .system)
    let popUpTitle = UILabel()
    let popUpSubTitle = UILabel()
    let blackOverlayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonLeaveAccount.layer.cornerRadius = 20
        buttonDeleteAccount.layer.cornerRadius = 20
        buttonSaveAccount.layer.cornerRadius = 20
        popUpLeave.layer.cornerRadius = 20
        popUpButtonLeave.layer.cornerRadius = 20
        popUpButtonCancel.layer.cornerRadius = 20
        popUpButtonDelete.layer.cornerRadius = 20
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
        
        blackOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blackOverlayView.translatesAutoresizingMaskIntoConstraints = false
        blackOverlayView.isHidden = true
        view.addSubview(blackOverlayView)
        
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
        buttonLeaveAccount.addTarget(self, action: #selector(buttonLeaveAccountMeta), for: .touchUpInside)
        view.addSubview(buttonLeaveAccount)
        
        buttonDeleteAccount.setTitle("Удалить аккаунт", for: .normal)
        buttonDeleteAccount.setTitleColor(AppColor.redCustom.uiColor, for: .normal)
        buttonDeleteAccount.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonDeleteAccount.backgroundColor = AppColor.redLightCustom.uiColor
        buttonDeleteAccount.translatesAutoresizingMaskIntoConstraints = false
        buttonDeleteAccount.addTarget(self, action: #selector(buttonDeleteAccountMeta), for: .touchUpInside)
        view.addSubview(buttonDeleteAccount)
        
        buttonSaveAccount.setTitle("Сохранить изменения", for: .normal)
        buttonSaveAccount.setTitleColor(.black, for: .normal)
        buttonSaveAccount.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonSaveAccount.backgroundColor = AppColor.yellowCustom.uiColor
        buttonSaveAccount.isHidden = true
        buttonSaveAccount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSaveAccount)
        
        lastNameField.placeholder = "Иванов"
        lastNameField.title = "Фамилия"
        lastNameField.font = UIFont(name: "Inter-Regular", size: 18)
        lastNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        lastNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        lastNameField.isEnabled = false
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lastNameField)
        
        firstNameField.placeholder = "Иван"
        firstNameField.title = "Имя"
        firstNameField.font = UIFont(name: "Inter-Regular", size: 18)
        firstNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        firstNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        firstNameField.textContentType = .none
        firstNameField.isEnabled = false
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNameField)
        
        middleNameField.placeholder = "Иванович"
        middleNameField.title = "Отчество"
        middleNameField.font = UIFont(name: "Inter-Regular", size: 18)
        middleNameField.selectedLineColor = AppColor.yellowCustom.uiColor
        middleNameField.selectedTitleColor = AppColor.yellowCustom.uiColor
        middleNameField.textContentType = .none
        middleNameField.isEnabled = false
        middleNameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(middleNameField)
        
        phoneField.placeholder = "+7 (999) 123 45 67"
        phoneField.title = "Телефон"
        phoneField.font = UIFont(name: "Inter-Regular", size: 18)
        phoneField.selectedLineColor = AppColor.yellowCustom.uiColor
        phoneField.selectedTitleColor = AppColor.yellowCustom.uiColor
        phoneField.textContentType = .none
        phoneField.keyboardType = .phonePad
        phoneField.isEnabled = false
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneField)
        
        buttonEdit.setImage(UIImage(named: "edit"), for: .normal)
        buttonEdit.addTarget(self, action: #selector(buttonEditMeta), for: .touchUpInside)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonEdit)
        
        buttonLeft.setImage(UIImage(named: "arrowLeft"), for: .normal)
        buttonLeft.isHidden = true
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.addTarget(self, action: #selector(buttonLeftMete), for: .touchUpInside)
        view.addSubview(buttonLeft)
        
        popUpLeave.backgroundColor = .white
        popUpLeave.isHidden = true
        popUpLeave.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popUpLeave)
        
        popUpButtonLeave.setTitle("Выйти", for: .normal)
        popUpButtonLeave.setTitleColor(.white, for: .normal)
        popUpButtonLeave.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        popUpButtonLeave.backgroundColor = .black
        popUpButtonLeave.isHidden = true
        popUpButtonLeave.translatesAutoresizingMaskIntoConstraints = false
        popUpButtonLeave.addTarget(self, action: #selector(popUpButtonLeaveMeta), for: .touchUpInside)
        view.addSubview(popUpButtonLeave)
        
        popUpButtonCancel.setTitle("Отмена", for: .normal)
        popUpButtonCancel.setTitleColor(.black, for: .normal)
        popUpButtonCancel.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        popUpButtonCancel.backgroundColor = AppColor.yellowLightCustom.uiColor
        popUpButtonCancel.isHidden = true
        popUpButtonCancel.translatesAutoresizingMaskIntoConstraints = false
        popUpButtonCancel.addTarget(self, action: #selector(popUpButtonCancelMeta), for: .touchUpInside)
        view.addSubview(popUpButtonCancel)
        
        popUpButtonDelete.setTitle("Удалить", for: .normal)
        popUpButtonDelete.setTitleColor(.white, for: .normal)
        popUpButtonDelete.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        popUpButtonDelete.backgroundColor = AppColor.redCustom.uiColor
        popUpButtonDelete.isHidden = true
        popUpButtonDelete.translatesAutoresizingMaskIntoConstraints = false
        popUpButtonDelete.addTarget(self, action: #selector(popUpButtonDeleteMeta), for: .touchUpInside)
        view.addSubview(popUpButtonDelete)
        
        popUpTitle.textColor = .black
        popUpTitle.font = UIFont(name: "Inter-SemiBold", size: 32)
        popUpTitle.numberOfLines = 0
        popUpTitle.isHidden = true
        popUpTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popUpTitle)
        
        popUpSubTitle.textColor = .black
        popUpSubTitle.font = UIFont(name: "Inter-Regular", size: 16)
        popUpSubTitle.numberOfLines = 0
        popUpSubTitle.isHidden = true
        popUpSubTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popUpSubTitle)
    }
    
    @objc func popUpButtonLeaveMeta() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(onboardingVC, animated: true)
    }
    
    @objc func popUpButtonCancelMeta() {
        if let tabBarController = self.tabBarController {
            tabBarController.tabBar.isHidden = false
        }
        
        blackOverlayView.isHidden = true
        popUpLeave.isHidden = true
        popUpButtonLeave.isHidden = true
        popUpButtonCancel.isHidden = true
        popUpButtonDelete.isHidden = true
        
        popUpTitle.isHidden = true
        popUpSubTitle.isHidden = true
                
        popUpTitle.text = "Выйти из аккаунта?"
        popUpSubTitle.text = "Вы уверены, что хотите выйти из профиля?"
    }
    
    @objc func popUpButtonDeleteMeta() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(onboardingVC, animated: true)
    }
    
    @objc func buttonEditMeta() {
        UIView.animate(withDuration: 1) {
            self.buttonEdit.isHidden = true
            self.buttonLeft.isHidden = false
            self.profileLabel.text = "Редактировать профиль"
            
            self.lastNameField.isEnabled = true
            self.firstNameField.isEnabled = true
            self.middleNameField.isEnabled = true
            self.phoneField.isEnabled = true
            
            self.buttonLeaveAccount.isHidden = true
            self.buttonDeleteAccount.isHidden = true
            
            self.buttonSaveAccount.isHidden = false
            
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonLeftMete() {
        UIView.animate(withDuration: 1) {
            self.buttonEdit.isHidden = false
            self.buttonLeft.isHidden = true
            self.profileLabel.text = "Профиль"
            
            self.lastNameField.isEnabled = false
            self.firstNameField.isEnabled = false
            self.middleNameField.isEnabled = false
            self.phoneField.isEnabled = false
            
            self.buttonLeaveAccount.isHidden = false
            self.buttonDeleteAccount.isHidden = false
            
            self.buttonSaveAccount.isHidden = true
            
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func buttonDeleteAccountMeta() {
        if let tabBarController = self.tabBarController {
            tabBarController.tabBar.isHidden = true
        }
        
        blackOverlayView.isHidden = false
        popUpLeave.isHidden = false
        popUpButtonDelete.isHidden = false
        popUpButtonCancel.isHidden = false
        
        popUpTitle.isHidden = false
        popUpSubTitle.isHidden = false
                
        popUpTitle.text = "Удалить аккаунт?"
        popUpSubTitle.text = "Вы уверены, что хотите удалить из аккаунт?"
    }
    
    @objc func buttonLeaveAccountMeta() {
        
        if let tabBarController = self.tabBarController {
            tabBarController.tabBar.isHidden = true
        }
        
        blackOverlayView.isHidden = false
        popUpLeave.isHidden = false
        popUpButtonLeave.isHidden = false
        popUpButtonCancel.isHidden = false
        
        popUpTitle.isHidden = false
        popUpSubTitle.isHidden = false
                
        popUpTitle.text = "Выйти из аккаунта?"
        popUpSubTitle.text = "Вы уверены, что хотите выйти из профиля?"
    }
}

extension ProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
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
            buttonDeleteAccount.heightAnchor.constraint(equalToConstant: 56),
            
            buttonSaveAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonSaveAccount
                .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonSaveAccount.heightAnchor.constraint(equalToConstant: 56),
            
            buttonEdit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            popUpLeave.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpLeave.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpLeave.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popUpLeave.heightAnchor.constraint(equalToConstant: 230),
            
            popUpButtonLeave.bottomAnchor.constraint(equalTo: popUpLeave.bottomAnchor, constant: -44),
            popUpButtonLeave.leadingAnchor.constraint(equalTo: popUpLeave.leadingAnchor, constant: 16),
            popUpButtonLeave.heightAnchor.constraint(equalToConstant: 56),
            popUpButtonLeave.widthAnchor.constraint(equalToConstant: 170.5),
            
            popUpButtonCancel.bottomAnchor.constraint(equalTo: popUpLeave.bottomAnchor, constant: -44),
            popUpButtonCancel.trailingAnchor.constraint(equalTo: popUpLeave.trailingAnchor, constant: -16),
            popUpButtonCancel.heightAnchor.constraint(equalToConstant: 56),
            popUpButtonCancel.widthAnchor.constraint(equalToConstant: 170.5),
            
            popUpButtonDelete.bottomAnchor.constraint(equalTo: popUpLeave.bottomAnchor, constant: -44),
            popUpButtonDelete.leadingAnchor.constraint(equalTo: popUpLeave.leadingAnchor, constant: 16),
            popUpButtonDelete.heightAnchor.constraint(equalToConstant: 56),
            popUpButtonDelete.widthAnchor.constraint(equalToConstant: 170.5),
            
            blackOverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            blackOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            popUpTitle.topAnchor.constraint(equalTo: popUpLeave.topAnchor, constant: 24),
            popUpTitle.leadingAnchor.constraint(equalTo: popUpLeave.leadingAnchor, constant: 16),
            
            popUpSubTitle.topAnchor.constraint(equalTo: popUpTitle.bottomAnchor, constant: 16),
            popUpSubTitle.leadingAnchor.constraint(equalTo: popUpLeave.leadingAnchor, constant: 16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                buttonDeleteAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
                buttonSaveAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
                buttonEdit.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                buttonLeft.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                buttonDeleteAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -74),
                buttonSaveAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -74),
                buttonEdit.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                buttonLeft.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}
