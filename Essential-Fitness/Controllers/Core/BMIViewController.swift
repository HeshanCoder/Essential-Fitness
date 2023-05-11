//
//  BMIViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import UIKit

class BMIViewController: UIViewController {
    
    // UI Elements
  
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Weight (kg)"
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()

    //private let weightTextField = CustomTextField(fieldType: .height)
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Height (m)"
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let calculateButton: UIButton = {
        let button = CustomButton(title: "Calculate BMI", hasBackground: true, fontSize: .med)
        //button.setTitle("Calculate BMI", for: .normal)
        button.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(genderSegmentedControl)
        view.addSubview(calculateButton)
        view.addSubview(resultLabel)
        
        let margin: CGFloat = 10
        
        NSLayoutConstraint.activate([
            weightTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            heightTextField.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: margin),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            genderSegmentedControl.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: margin),
            genderSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //calculateButton.topAnchor.constraint(equalTo: genderSegmentedControl.bottomAnchor, constant: margin),
            //calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.topAnchor.constraint(equalTo: self.genderSegmentedControl.bottomAnchor, constant: 11),
            calculateButton.centerXAnchor.constraint(equalTo: self.genderSegmentedControl.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            calculateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
            
            resultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: margin),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
        ])
        
        // Apply styling
        //weightTextField.backgroundColor = .white
        weightTextField.layer.cornerRadius = 8
        weightTextField.layer.borderWidth = 1
        weightTextField.layer.borderColor = UIColor.lightGray.cgColor
        weightTextField.setLeftPadding(10)
        
        //heightTextField.backgroundColor = .white
        heightTextField.layer.cornerRadius = 8
        heightTextField.layer.borderWidth = 1
        heightTextField.layer.borderColor = UIColor.lightGray.cgColor
        heightTextField.setLeftPadding(10)
        
        genderSegmentedControl.tintColor = .systemBackground
        
        calculateButton.backgroundColor = .systemBlue
        calculateButton.setTitleColor(.black, for: .normal)
        calculateButton.layer.cornerRadius = 8
        
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
    }
    
    // MARK: - BMI Calculation
    
    @objc private func calculateBMI() {
        guard let weightText = weightTextField.text,
              let weight = Double(weightText),
              let heightText = heightTextField.text,
              let height = Double(heightText),
              height > 0 else {
            resultLabel.text = "Invalid input"
            return
        }
        
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender = genderIndex == 0 ? "Male" : "Female"
        
        let bmi = weight / (height * height)
        let formattedBMI = String(format: "%.2f", bmi)
        resultLabel.text = "Gender: \(gender)\nBMI: \(formattedBMI)"
    }
}




extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
