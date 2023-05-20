//
//  BMIViewController.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import UIKit

class BMIViewController: UIViewController {
    
    // UI Elements
  /*
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Weight (kg)"
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
*/
    private let weightTextField = CustomTextField(fieldType: .weight)
    private let heightTextField = CustomTextField(fieldType: .height)
    /*
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Height (m)"
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        return textField
    }()
     */
    
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
    
    
    private let overviewLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // that means this can take multiple lines
        label.text = ""
        return label
    }()
    
    private let timePicker = UIDatePicker()
    private let scheduleButton: UIButton = {
        let button = CustomButton(title: "Schedule Reminder", hasBackground: true, fontSize: .med)
        //button.setTitle("Calculate BMI", for: .normal)
        button.addTarget(self, action: #selector(scheduleReminder), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        title = "BMI Calculator"
        //navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let caLayer = CAGradientLayer()
        caLayer.frame = view.bounds
        caLayer.colors = [
            UIColor.systemGreen.cgColor,
            UIColor.systemYellow.cgColor
        ]
        
        view.layer.addSublayer(caLayer)
        setupUI()
        setupDatePicker()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    if let error = error {
                        print("Error requesting notification authorization: \(error.localizedDescription)")
                    } else {
                        if granted {
                            print("Notification authorization granted")
                        } else {
                            print("Notification authorization denied")
                        }
                    }
                }
    }

    private func setupDatePicker() {
         timePicker.datePickerMode = .time
         timePicker.minimumDate = Date()
     }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(genderSegmentedControl)
        view.addSubview(calculateButton)
        view.addSubview(resultLabel)
        view.addSubview(overviewLabel)
        view.addSubview(timePicker)
        view.addSubview(scheduleButton)
        
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        scheduleButton.translatesAutoresizingMaskIntoConstraints = false
        
        //scheduleButton.addTarget(self, action: #selector(scheduleReminder), for: .touchUpInside)
        
        let margin: CGFloat = 15
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.textColor = .secondarySystemBackground
        weightTextField.attributedPlaceholder = NSAttributedString(string: "Weight (kg)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.textColor = .secondarySystemBackground
        heightTextField.attributedPlaceholder = NSAttributedString(string: "Height (m)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        NSLayoutConstraint.activate([
            weightTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            weightTextField.heightAnchor.constraint(equalToConstant: 50),
            
            heightTextField.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: margin),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            heightTextField.heightAnchor.constraint(equalToConstant: 50),
            
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
            
            overviewLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: margin),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            timePicker.centerXAnchor.constraint(equalTo: self.genderSegmentedControl.centerXAnchor),
            timePicker.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: margin),

            scheduleButton.centerXAnchor.constraint(equalTo: self.genderSegmentedControl.centerXAnchor),
            scheduleButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            scheduleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.85),
 
        ])
        
        // Apply styling
        //weightTextField.backgroundColor = .white
        /*
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
         */
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
 
    }
    @objc private func scheduleReminder() {
            let selectedTime = timePicker.date
            let reminderTime = selectedTime.addingTimeInterval(-60) // 1 minute before selected time
            
            // Create a notification content
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = "It's time!"
            
            // Set the notification trigger with the selected time
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: selectedTime)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            
            // Create a notification request
            let request = UNNotificationRequest(identifier: "ReminderNotification", content: content, trigger: trigger)
            
            // Schedule the notification
            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                } else {
                    print("Reminder notification scheduled successfully")
                }
            }
            
            // Schedule a reminder notification 1 minute before the selected time
            let reminderContent = UNMutableNotificationContent()
            reminderContent.title = "Reminder"
            reminderContent.body = "Your event is coming up in 1 minute!"
            
            let reminderTriggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderTime)
            let reminderTrigger = UNCalendarNotificationTrigger(dateMatching: reminderTriggerDate, repeats: false)
            
            let reminderRequest = UNNotificationRequest(identifier: "ReminderNotification", content: reminderContent, trigger: reminderTrigger)
            
            UNUserNotificationCenter.current().add(reminderRequest) { (error) in
                if let error = error {
                    print("Error scheduling reminder notification: \(error)")
                } else {
                    print("Reminder notification scheduled successfully")
                }
            }
        }
    
    @objc private func calculateBMI() {
        guard let weightText = weightTextField.text,
              let weight = Double(weightText),
              let heightText = heightTextField.text,
              let height = Double(heightText),
              height > 0 else {
            AlertManager.showInvalideBMICalculationError(on: self)
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
