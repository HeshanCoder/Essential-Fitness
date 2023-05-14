//
//  TermsAndConditionViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/14/23.
//

import UIKit

class TermsAndConditionViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let termsLabel = UILabel()
    private let agreeButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.text = "Terms and Conditions:\n\n1. You must agree to the terms and conditions to use this app."
        termsLabel.numberOfLines = 0
        scrollView.addSubview(termsLabel)
        
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        agreeButton.setTitle("Agree", for: .normal)
        agreeButton.addTarget(self, action: #selector(agreeButtonTapped), for: .touchUpInside)
        scrollView.addSubview(agreeButton)
    }
    
    private func setupConstraints() {
        let margins = view.safeAreaLayoutGuide
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let termsLabelConstraints = [
            termsLabel.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 16),
            termsLabel.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 16),
            termsLabel.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(termsLabelConstraints)
        
        let agreeButtonConstraints = [
            agreeButton.topAnchor.constraint(equalTo: termsLabel.bottomAnchor, constant: 16),
            agreeButton.centerXAnchor.constraint(equalTo: contentLayoutGuide.centerXAnchor),
            agreeButton.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(agreeButtonConstraints)
    }
    
    @objc private func agreeButtonTapped() {
        // Handle user agreement and Firebase login here
        // Show next view controller after successful login
        let userDetailViewController = UserDetailViewController()
        navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}

class UserDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch and display user details here
        // Customize this view controller according to your requirements
        view.backgroundColor = .white
        title = "User Details"
        
        let userDetailsLabel = UILabel()
        userDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        userDetailsLabel.text = "User Details: \n\nName: John Doe\nAge: 25\nGender: Male"
        userDetailsLabel.numberOfLines = 0
        view.addSubview(userDetailsLabel)
        
        let margins = view.safeAreaLayoutGuide
        let constraints = [
            userDetailsLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),
            userDetailsLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            userDetailsLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16),
            userDetailsLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
