//
//  AlertManager.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/5/23.
//

import Foundation
import UIKit

class AlertManager{
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?){
       // pass the controller that we are in and then alert on that view controller
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}


extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "\(error.localizedDescription)")
    }
}


extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Signing In", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Signing In", message: "\(error.localizedDescription)")
    }
}


extension AlertManager {
    
    public static func showLogoutError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Log Out Error", message: "\(error.localizedDescription)")
    }
}

extension AlertManager {

    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset Sent", message: nil)
    }
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Sending Password Reset", message: "\(error.localizedDescription)")
    }
}

extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Error Fetching User", message: nil)
    }
}

extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid username.")
    }
}

extension AlertManager {
    
    public static func showInvalideBMICalculationError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Values or one of the values you added is wrong. \n use numbers only", message: nil)
    }
}

extension AlertManager {
    
    public static func showUpdateUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Error happen when updating", message: nil)
    }
}

extension AlertManager {
    
    public static func showHeightFieldError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Value of Height field is not in \n correct format (select numbers)", message: nil)
    }
    
    public static func showWeightFieldError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Value of Weight field is not in \n correct format (select numbers)", message: nil)
    }
}


extension AlertManager {
    public static func showFetchUserError(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unable to get user info", message: nil)
    }
}
