//
//  SupportViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField

class SupportViewController: UIViewController {

    let supportLabel = UILabel()
    let FIOField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let phoneField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let messageField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonRegister = UIButton(type: .system)
    let privacyLabel = UILabel()
    
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
        FIOField.resignFirstResponder()
        phoneField.resignFirstResponder()
        messageField.resignFirstResponder()
        phoneField.resignFirstResponder()
        view.endEditing(true)
    }
}

extension SupportViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        supportLabel.text = "Связь с менеджером"
        supportLabel.textColor = .black
        supportLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        supportLabel.textAlignment = .center
        supportLabel.numberOfLines = 0
        supportLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(supportLabel)
        
        buttonRegister.setTitle("Отправить", for: .normal)
        buttonRegister.setTitleColor(.black, for: .normal)
        buttonRegister.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonRegister.backgroundColor = AppColor.yellowCustom.uiColor
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonRegister)
        
        FIOField.placeholder = "Иванов Иван Иванович"
        FIOField.title = "ФИО"
        FIOField.font = UIFont(name: "Inter-Regular", size: 18)
        FIOField.selectedLineColor = AppColor.yellowCustom.uiColor
        FIOField.selectedTitleColor = AppColor.yellowCustom.uiColor
        FIOField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(FIOField)
        
        phoneField.placeholder = "+7 (999) 123 45 67"
        phoneField.title = "Телефон"
        phoneField.font = UIFont(name: "Inter-Regular", size: 18)
        phoneField.selectedLineColor = AppColor.yellowCustom.uiColor
        phoneField.selectedTitleColor = AppColor.yellowCustom.uiColor
        phoneField.textContentType = .none
        phoneField.keyboardType = .phonePad
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneField)
        
        messageField.placeholder = "Сообщение..."
        messageField.title = "Сообщение"
        messageField.font = UIFont(name: "Inter-Regular", size: 18)
        messageField.selectedLineColor = AppColor.yellowCustom.uiColor
        messageField.selectedTitleColor = AppColor.yellowCustom.uiColor
        messageField.textContentType = .none
        messageField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageField)
        
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
}

extension SupportViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            supportLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            FIOField.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 40),
            FIOField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            FIOField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            phoneField.topAnchor.constraint(equalTo: FIOField.bottomAnchor, constant: 32),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            messageField.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 32),
            messageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            messageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonRegister.bottomAnchor.constraint(equalTo: privacyLabel.topAnchor, constant: -24),
            buttonRegister.heightAnchor.constraint(equalToConstant: 56),
            
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                supportLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),
            ])
        } else {
            NSLayoutConstraint.activate([
                supportLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                privacyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -74),
            ])
        }
    }
}
