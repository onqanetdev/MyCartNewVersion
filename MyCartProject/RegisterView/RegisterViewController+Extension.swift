//
//  RegisterViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit





//extension RegisterViewController: UITextFieldDelegate {
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text = ""
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField.text == "" || ((textField.text?.isEmpty) != nil) {
//            if textField == userNmTxtFld {
//                textField.text = "User Name"
//            } else if textField == userEmailIdTxtField {
//                textField.text = "Email ID"
//            } else if textField == passWordTxtField {
//                textField.text = "Password"
//            } else if textField == confirmPassWordTxtField {
//                textField.text = "Confirm Password"
//            }
//        }
//    }
//    
//    
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        if confirmPassWordTxtField.isHidden == true && userEmailIdTxtField.isHidden == true {
//            
//            if textField == userNmTxtFld {
//                passWordTxtField.becomeFirstResponder()
//            } else if textField == passWordTxtField {
//                textField.resignFirstResponder()
//                navigateToNextScreen() // Call your navigation logic here
//            }
//            
//        } else {
//            
//            if textField == userNmTxtFld {
//                userEmailIdTxtField.becomeFirstResponder()
//            } else if textField == passWordTxtField {
//                confirmPassWordTxtField.becomeFirstResponder()
//            } else if textField == userEmailIdTxtField {
//                passWordTxtField.becomeFirstResponder()
//            } else if textField == confirmPassWordTxtField {
//                textField.resignFirstResponder()
//                navigateToNextScreen() // Call your navigation logic here
//            }
//            
//        }
//            return true
//        }
//    
//    
//    
//    func navigateToNextScreen() {
//        navigationController?.pushViewController(HomeViewController(), animated: true)
//    }
//    
//    
//    
//    
//    @objc func keyboardWillShow(notification:NSNotification) {
//
//        guard let userInfo = notification.userInfo else { return }
//        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
//
//        var contentInset:UIEdgeInsets = self.scrollView.contentInset
//        contentInset.bottom = keyboardFrame.size.height + 80
//        scrollView.contentInset = contentInset
//    }
//
//    @objc func keyboardWillHide(notification:NSNotification) {
//
//        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
//        scrollView.contentInset = contentInset
//    }
//    
//}



extension RegisterViewController: UITextFieldDelegate {
    
    // The view controller now accesses the text fields through its `registerView` property.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" || textField.text?.isEmpty == true {
            if textField == registerView.userNmTxtFld {
                textField.text = "User Name"
            } else if textField == registerView.userEmailIdTxtField {
                textField.text = "Email ID"
            } else if textField == registerView.passWordTxtField {
                textField.text = "Password"
            } else if textField == registerView.confirmPassWordTxtField {
                textField.text = "Confirm Password"
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Use the `registerView` properties to check for the hidden state.
        if registerView.confirmPassWordTxtField.isHidden && registerView.userEmailIdTxtField.isHidden {
            
            if textField == registerView.userNmTxtFld {
                registerView.passWordTxtField.becomeFirstResponder()
            } else if textField == registerView.passWordTxtField {
                textField.resignFirstResponder()
                // You will need to move this method to the view controller
                // or have the delegate call the navigation method
                navigateToNextScreen()
            }
            
        } else {
            
            if textField == registerView.userNmTxtFld {
                registerView.userEmailIdTxtField.becomeFirstResponder()
            } else if textField == registerView.userEmailIdTxtField {
                registerView.passWordTxtField.becomeFirstResponder()
            } else if textField == registerView.passWordTxtField {
                registerView.confirmPassWordTxtField.becomeFirstResponder()
            } else if textField == registerView.confirmPassWordTxtField {
                textField.resignFirstResponder()
                navigateToNextScreen()
            }
        }
        return true
    }
    
    func navigateToNextScreen() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        registerView.scrollView.contentInset = contentInset
        registerView.scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = .zero
        registerView.scrollView.contentInset = contentInset
        registerView.scrollView.scrollIndicatorInsets = contentInset
    }
    
}



