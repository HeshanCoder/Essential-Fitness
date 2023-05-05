//
//  LoginViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit

class LoginViewController: UIViewController {

    // using created AuthHeaderView UIView custom componnent
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign into Your Account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New user? Create Account", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        self.setUpUI()
        
        // Registering events. (Target: is the button itself, action: an action to happend. exampale a method, for : UI event)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    
    @objc func didTapSignIn(){
        //print("DEBUG PRINT:", "didTapSignIn")
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func didTapNewUser(){
        //print("DEBUG PRINT:", "didTapNewUser")
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPassword(){
        //print("DEBUG PRINT:", "didTapNewUser")
        let vc = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        // dev perpose
        //self.didTapNewUser()
    }
    
    func setUpUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // layoutMarginsGuide will prevent app screen go over status bar
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.usernameField.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 22),
            self.signInButton.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 11),
            self.newUserButton.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.newUserButton.bottomAnchor, constant: 6    ),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85)
            
        ])
        
        //headerView.backgroundColor = .red
        //usernameField.backgroundColor = .green
    }

}
