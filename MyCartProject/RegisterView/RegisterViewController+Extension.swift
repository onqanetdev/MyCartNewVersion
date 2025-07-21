//
//  RegisterViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit





extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" || ((textField.text?.isEmpty) != nil) {
            if textField == emailTextField {
                textField.text = "Email"
            } else if textField == passWordTxtField {
                textField.text = "Password"
            } else if textField == confirmPassWordTxtField {
                textField.text = "Confirm Password"
            }
        }
    }
    
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == emailTextField {
                passWordTxtField.becomeFirstResponder()
            } else if textField == passWordTxtField {
                confirmPassWordTxtField.becomeFirstResponder()
            } else if textField == confirmPassWordTxtField {
                textField.resignFirstResponder()
                navigateToNextScreen() // Call your navigation logic here
            }
            return true
        }
    
    
    
    func navigateToNextScreen() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    
    
    
    //NotificationCenter Functions
    
//    @objc func keyboardWillShow(sender: NSNotification) {
//        
//        contentView.frame.origin.y = 0
//        
//        contentView.frame.origin.y =  contentView.frame.origin.y - 160
//        
//        
//    }
//    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        
//        contentView.frame.origin.y = 0
//        if contentView.frame.origin.y != 0 {
//            contentView.frame.origin.y = 0
//            
//        }
//    }
    
    
    
    @objc func keyboardWillShow(notification:NSNotification) {

        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 80
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {

        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
}







