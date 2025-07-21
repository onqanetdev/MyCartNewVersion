//
//  LoginViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit


extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" || ((textField.text?.isEmpty) != nil) {
            if textField == emailTextField {
                textField.text = "Email"
            } else if textField == passWordTxtField {
                textField.text = "Password"
            }
        }
    }
}
