//
//  ForgotPasswordViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
    
    private let emailField = CustomTextField(fieldType: .email)
    
    private let resetPasswordButton = CustomButton(title: "Reset Password", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let caLayer = CAGradientLayer()
        caLayer.frame = view.bounds
        caLayer.colors = [
            UIColor.systemGreen.cgColor,
            UIColor.systemYellow.cgColor
        ]
        view.layer.addSublayer(caLayer)
        
        self.setupUI()
        
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // enable navigation bar
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.textColor = .secondarySystemBackground
        emailField.attributedPlaceholder = NSAttributedString(string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 230),
            
            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            self.resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    @objc private func didTapForgotPassword() {
        // guard let email = self.emailField.text, !email.isEmpty else { return }
        
        let email = self.emailField.text ?? ""
        
        if !Validator.isValidEmail(for: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            
            AlertManager.showPasswordResetSent(on: self)
        }
    }
    
}
