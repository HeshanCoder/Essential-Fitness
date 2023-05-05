//
//  RegisterViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/4/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // using created AuthHeaderView UIView custom componnent
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create Your Account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signUpButton = CustomButton(title: "Sign Up.", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Alredy have an account? Sign In.", fontSize: .med)
    
    private let termTextView: UITextView = {
        let tv = UITextView()
        tv.text = "By creating an  account you agree with our terms and conditions"
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        self.setUpUI()
        
        // Registering events. (Target: is the button itself, action: an action to happend. exampale a method, for : UI event)
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
       
    }
    
    @objc func didTapSignUp(){
        print("DEBUG PRINT:", "didTapSignUp")
    }
    
    @objc func didTapSignIn(){
        //print("DEBUG PRINT:", "didTapSignUp")
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        // dev perpose
        // self.didTapNewUser()
    }
    
    func setUpUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termTextView)
        self.view.addSubview(signInButton)
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.termTextView.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false

        
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
            
            self.emailField.topAnchor.constraint(equalTo: self.usernameField.bottomAnchor, constant: 12),
            self.emailField.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.termTextView.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 6),
            self.termTextView.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.termTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: self.termTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
        ])
        
        //headerView.backgroundColor = .red
        //usernameField.backgroundColor = .green
    }

}
