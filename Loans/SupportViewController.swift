//
//  SupportViewController.swift
//  Loans
//
//  Created by Ravil on 15.12.2023.
//

import UIKit
import SkyFloatingLabelTextField
import InputMask

class SupportViewController: UIViewController {

    let supportLabel = UILabel()
    let FIOField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let phoneField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let messageField = SkyFloatingLabelTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 85))
    let buttonContinue = UIButton(type: .system)
    let privacyLabel = UILabel()
    let popUpSupport = UIView()
    let popUpTitle = UILabel()
    let popUpSubTitle = UILabel()
    let popUpButton = UIButton(type: .system)
    let blackOverlayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonContinue.layer.cornerRadius = 20
        popUpButton.layer.cornerRadius = 20
    }
    
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
}

extension SupportViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        blackOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blackOverlayView.translatesAutoresizingMaskIntoConstraints = false
        blackOverlayView.isHidden = true
        view.addSubview(blackOverlayView)
        
        supportLabel.text = "Связь с менеджером"
        supportLabel.textColor = .black
        supportLabel.font = UIFont(name: "Inter-SemiBold", size: 20)
        supportLabel.textAlignment = .center
        supportLabel.numberOfLines = 0
        supportLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(supportLabel)
        
        buttonContinue.setTitle("Отправить", for: .normal)
        buttonContinue.setTitleColor(.black, for: .normal)
        buttonContinue.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        buttonContinue.backgroundColor = AppColor.yellowCustom.uiColor
        buttonContinue.translatesAutoresizingMaskIntoConstraints = false
        buttonContinue.isEnabled = false
        buttonContinue.addTarget(self, action: #selector(buttonContinueMeta), for: .touchUpInside)
        view.addSubview(buttonContinue)
        
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
        phoneField.delegate = phoneListener
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneField)
        
        messageField.placeholder = "Сообщение..."
        messageField.title = "Сообщение"
        messageField.font = UIFont(name: "Inter-Regular", size: 18)
        messageField.selectedLineColor = AppColor.yellowCustom.uiColor
        messageField.selectedTitleColor = AppColor.yellowCustom.uiColor
        messageField.textContentType = .none
        messageField.addTarget(self, action: #selector(messageFieldDidChange(_:)), for: .editingChanged)
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
        
        popUpSupport.backgroundColor = .white
        popUpSupport.isHidden = true
        popUpSupport.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popUpSupport)
        
        popUpButton.setTitle("Продолжить", for: .normal)
        popUpButton.setTitleColor(.black, for: .normal)
        popUpButton.titleLabel?.font = UIFont(name: "Inter-Medium", size: 20)
        popUpButton.backgroundColor = AppColor.yellowCustom.uiColor
        popUpButton.isHidden = true
        popUpButton.translatesAutoresizingMaskIntoConstraints = false
        popUpButton.addTarget(self, action: #selector(popUpButtonMeta), for: .touchUpInside)
        view.addSubview(popUpButton)
        
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
    
    @objc func messageFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, text.count >= 5 {
            buttonContinue.isEnabled = true
        } else {
            buttonContinue.isEnabled = false
        }
    }
    
    @objc func buttonContinueMeta() {
        if let tabBarController = self.tabBarController {
            tabBarController.tabBar.isHidden = true
        }
        
        FIOField.isEnabled = false
        phoneField.isEnabled = false
        messageField.isEnabled = false
        
        popUpSupport.isHidden = false
        popUpTitle.isHidden = false
        popUpSubTitle.isHidden = false
        popUpButton.isHidden = false
        blackOverlayView.isHidden = false
        
        popUpTitle.text = "Спасибо!"
        popUpSubTitle.text = "Ваше сообщение отправлено. Мы свяжемся с вами в ближайшее время."
    }
    
    @objc func popUpButtonMeta() {
        if let tabBarController = self.tabBarController {
            tabBarController.tabBar.isHidden = false
        }
        
        popUpSupport.isHidden = true
        popUpTitle.isHidden = true
        popUpSubTitle.isHidden = true
        popUpButton.isHidden = true
        blackOverlayView.isHidden = true
        
        FIOField.isEnabled = true
        phoneField.isEnabled = true
        messageField.isEnabled = true
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
            
            buttonContinue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonContinue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonContinue.bottomAnchor.constraint(equalTo: privacyLabel.topAnchor, constant: -24),
            buttonContinue.heightAnchor.constraint(equalToConstant: 56),
            
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            privacyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            popUpSupport.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpSupport.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpSupport.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            popUpSupport.heightAnchor.constraint(equalToConstant: 249),
            
            popUpButton.bottomAnchor.constraint(equalTo: popUpSupport.bottomAnchor, constant: -44),
            popUpButton.leadingAnchor.constraint(equalTo: popUpSupport.leadingAnchor, constant: 16),
            popUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            popUpButton.heightAnchor.constraint(equalToConstant: 56),
            
            blackOverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            blackOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            popUpTitle.topAnchor.constraint(equalTo: popUpSupport.topAnchor, constant: 24),
            popUpTitle.leadingAnchor.constraint(equalTo: popUpSupport.leadingAnchor, constant: 16),
            
            popUpSubTitle.topAnchor.constraint(equalTo: popUpTitle.bottomAnchor, constant: 16),
            popUpSubTitle.leadingAnchor.constraint(equalTo: popUpSupport.leadingAnchor, constant: 16),
            popUpSubTitle.trailingAnchor.constraint(equalTo: popUpSupport.trailingAnchor, constant: -16),
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
