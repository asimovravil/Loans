//
//  RegisterProfileViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField
import InputMask

class RegisterProfileViewController: UIViewController {

    let dateLabel = UILabel()
    let lastNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let firstNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let middleNameField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let phoneField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonRegister = UIButton(type: .system)
    let privacyLabel = UILabel()
    
    private lazy var phoneListener: MaskedTextFieldDelegate = {
        let listener = MaskedTextFieldDelegate()
        listener.onMaskedTextChangedCallback = { textField, _, isFilled in
            let updatedText = textField.text ?? ""
            if isFilled {
                print("Text field is filled: \(updatedText)")
            }
        }
        listener.delegate = self
        listener.primaryMaskFormat = "+7 ([000]) [000] [00] [00]"
        return listener
    }()
    
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
    }
    
    @objc private func dismissKeyboard() {
        lastNameField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        middleNameField.resignFirstResponder()
        phoneField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension RegisterProfileViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        dateLabel.text = "Заполните данные"
        dateLabel.textColor = .black
        dateLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 0
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        
        buttonRegister.setTitle("Продолжить", for: .normal)
        buttonRegister.setTitleColor(.black, for: .normal)
        buttonRegister.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonRegister.backgroundColor = AppColor.yellowCustom.uiColor
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.addTarget(self, action: #selector(buttonRegisterMeta), for: .touchUpInside)
        view.addSubview(buttonRegister)
        
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
        phoneField.delegate = phoneListener
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneField)
        
        let privacyText = "Нажимая кнопку я даю согласие на обработку с\nсвоих персональных данных"
        let attributedText = NSMutableAttributedString(string: privacyText, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont(name: "Inter-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14),
        ])
        
        let yellowColor = AppColor.yellowCustom.uiColor
        let underlineRange = (attributedText.string as NSString).range(of: "своих персональных данных")
        attributedText.addAttributes([
            .foregroundColor: yellowColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ], range: underlineRange)
        
        privacyLabel.attributedText = attributedText
        privacyLabel.textAlignment = .center
        privacyLabel.numberOfLines = 2
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privacyLabel)
    }
    
    @objc func buttonRegisterMeta() {
        let requestSuccessVC = RequestSuccessViewController()
        requestSuccessVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(requestSuccessVC, animated: true)
        
        UserDefaults.standard.set(lastNameField.text, forKey: "userLastName")
        UserDefaults.standard.set(firstNameField.text, forKey: "userFirstName")
        UserDefaults.standard.set(middleNameField.text, forKey: "userMiddleName")
        UserDefaults.standard.set(phoneField.text, forKey: "userPhone")
    }
}

extension RegisterProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lastNameField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
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
            
            buttonRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonRegister.bottomAnchor.constraint(equalTo: privacyLabel.topAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 56),
            
            privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            ])
        } else {
            NSLayoutConstraint.activate([
                dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            ])
        }
    }
}
