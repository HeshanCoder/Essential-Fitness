//
//  CustomTextField.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/5/23.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case username
        case email
        case password
        case weight
        case height
        case birthday
        case fitnessGoal
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType){
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .yellow
        self.borderStyle = .roundedRect
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
        case .height:
            self.placeholder = "Height (m)"
            self.keyboardType = .decimalPad
        case .weight:
            self.placeholder = "Weight (kg)"
            self.keyboardType = .decimalPad
        case .birthday:
            self.placeholder = "Birthday"
        case .fitnessGoal:
            self.placeholder = "Fitness Goal"
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
