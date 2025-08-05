//
//  OTPVeriVC.swift
//  MyCartProject
//
//  Created by Onqanet on 04/08/25.
//

import UIKit

class OTPVeriVC: UIViewController {
    
    public var otpVerifyView: OTPVerificationView!
    
    override func loadView() {
        otpVerifyView = OTPVerificationView()
       
        self.view = otpVerifyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpVerifyView.otpTextField.delegate = self
        otpVerifyView.userNmTxtFld.delegate = self
        
        navigationController?.isNavigationBarHidden = true
        
        // We can still handle keyboard notifications here
        setupKeyboardHiding()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Navigation and Logic
    
    private func navigateToTrendingProducts() {
        // Implement your navigation logic here
    }
    
    private func navigateToForgetPassword() {
        let vc = ForgetPasswordViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}




extension OTPVeriVC: UITextFieldDelegate {
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        otpVerifyView.scrollView.contentInset = contentInset
        otpVerifyView.scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = .zero
        otpVerifyView.scrollView.contentInset = contentInset
        otpVerifyView.scrollView.scrollIndicatorInsets = contentInset
    }
}
