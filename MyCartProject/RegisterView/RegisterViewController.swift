//
//  RegisterViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//



import UIKit



class RegisterViewController: UIViewController {
    
    public var registerView: RegisterView!
    
    override func loadView() {
        registerView = RegisterView()
        registerView.delegate = self
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is a good place for delegation and initial setup
        registerView.userNmTxtFld.delegate = self
        registerView.passWordTxtField.delegate = self
        registerView.confirmPassWordTxtField.delegate = self
        registerView.userEmailIdTxtField.delegate = self
        
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




extension RegisterViewController: RegisterViewDelegate {
    
    func didTapLoginButton() {
        if registerView.loginBtn.titleLabel?.text == "Login" {
            // Handle login logic
            navigateToTrendingProducts()
        } else if registerView.loginBtn.titleLabel?.text == "Sign Up" {
            // Handle sign up logic
            // ...
        } else if registerView.loginBtn.titleLabel?.text == "Get OTP" {
            // Handle get OTP logic
            // ...
        }
    }
    
    func didTapSignUpButton() {
        if registerView.signUpBtn.titleLabel?.text == "Sign Up" {
            registerView.configureForSignUpState()
        } else {
            registerView.configureForLoginState()
        }
    }
    
    func didTapForgotPassword() {
        navigateToForgetPassword()
    }
    
    func didToggleCheckmark(isChecked: Bool) {
        if isChecked {
            registerView.configureForOTPLogin()
        } else {
            registerView.configureForPasswordLogin()
        }
    }
}
