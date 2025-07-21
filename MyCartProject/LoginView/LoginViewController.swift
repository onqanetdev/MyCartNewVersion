//
//  LoginViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit



class LoginViewController: UIViewController {
    
    let topBackgroundImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.image = UIImage(named: "header_background")
        img.contentMode = .scaleToFill
        return img
    }()
    
    let iconImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.image = UIImage(named: "launch_Screen")
        img.contentMode = .scaleAspectFit
        return img
    }()

    let dottedImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "ellipsis")
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.tintColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        return img
    }()
    
    let welcomeLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Welcome!"
        lbl.textColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        lbl.font = UIFont(name: "Helvetica-Bold", size: 48)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.5
        return lbl
    }()
    
    // Store bottom border layers for dynamic resizing
    private var emailBottomBorder: CALayer?
    private var passwordBottomBorder: CALayer?
    
    let emailTextField: UITextField = {
        let textFld = UITextField()
        textFld.translatesAutoresizingMaskIntoConstraints = false
        textFld.placeholder = "Email"
        textFld.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textFld.textColor = .black
        textFld.backgroundColor = .clear
        textFld.borderStyle = .none
        textFld.autocapitalizationType = .none
        textFld.keyboardType = .emailAddress
        textFld.autocorrectionType = .no
        return textFld
    }()
        
    let passWordTxtField: UITextField = {
        let textFld = UITextField()
        textFld.translatesAutoresizingMaskIntoConstraints = false
        textFld.placeholder = "Password"
        textFld.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textFld.textColor = .black
        textFld.backgroundColor = .clear
        textFld.borderStyle = .none
        textFld.isSecureTextEntry = true
        textFld.autocapitalizationType = .none
        textFld.autocorrectionType = .no
        return textFld
    }()
    
    let loginBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        btn.layer.cornerRadius = 20
        btn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        return btn
    }()
    
    let forgetPasswordBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot Password ?", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return btn
    }()
    
    let doNotHaveLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Don't have an account ?"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.8
        return lbl
    }()
    
    let createBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Create", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        btn.layer.cornerRadius = 20
        btn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        
        emailTextField.delegate = self
        passWordTxtField.delegate = self
        
        setUpAllImageView()
        setUpLabels()
        setUpTextFields()
        setupButtons()
        setupPasswordToggle()
        
        // Adjust for small screens
        adjustForScreenSize()
    }
    
    private func adjustForScreenSize() {
        let screenHeight = UIScreen.main.bounds.height
        
        // iPhone SE and similar small screens
        if screenHeight <= 667 {
            // Make welcome label smaller
            welcomeLbl.font = UIFont(name: "Helvetica-Bold", size: 36)
            
            // Reduce text field spacing
            if let emailTopConstraint = emailTextField.constraints.first(where: { $0.firstAnchor == emailTextField.topAnchor }) {
                emailTopConstraint.constant = 20
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBottomBorders()
    }

    func setUpAllImageView(){
        view.addSubview(topBackgroundImg)
        topBackgroundImg.addSubview(iconImg)
        
        NSLayoutConstraint.activate([
            // Use safe area for top constraint
            topBackgroundImg.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            topBackgroundImg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBackgroundImg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Make height responsive to screen size - smaller for compact screens
            topBackgroundImg.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.30),
            
            iconImg.centerXAnchor.constraint(equalTo: topBackgroundImg.centerXAnchor),
            iconImg.centerYAnchor.constraint(equalTo: topBackgroundImg.centerYAnchor, constant: 20),
            iconImg.heightAnchor.constraint(equalToConstant: 80),
            iconImg.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func setUpLabels() {
        view.addSubview(dottedImg)
        view.addSubview(welcomeLbl)
        
        NSLayoutConstraint.activate([
            dottedImg.topAnchor.constraint(equalTo: topBackgroundImg.bottomAnchor, constant: 20),
            dottedImg.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            dottedImg.widthAnchor.constraint(equalToConstant: 70),
            dottedImg.heightAnchor.constraint(equalToConstant: 40),
            
            welcomeLbl.topAnchor.constraint(equalTo: dottedImg.bottomAnchor, constant: 10),
            welcomeLbl.leadingAnchor.constraint(equalTo: dottedImg.leadingAnchor),
            welcomeLbl.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    func setUpTextFields(){
        view.addSubview(emailTextField)
        view.addSubview(passWordTxtField)
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: welcomeLbl.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passWordTxtField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passWordTxtField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passWordTxtField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passWordTxtField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupButtons(){
        view.addSubview(loginBtn)
        view.addSubview(forgetPasswordBtn)
        view.addSubview(doNotHaveLbl)
        view.addSubview(createBtn)
        
        NSLayoutConstraint.activate([
            // Login Button - full width with margins
            loginBtn.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 20),
            loginBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginBtn.heightAnchor.constraint(equalToConstant: 45),
            
            // Forget Password Button - centered
            forgetPasswordBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 8),
            forgetPasswordBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgetPasswordBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            // Don't have account label
            doNotHaveLbl.topAnchor.constraint(equalTo: forgetPasswordBtn.bottomAnchor, constant: 15),
            doNotHaveLbl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            doNotHaveLbl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            // Create Button - responsive width
            createBtn.topAnchor.constraint(equalTo: doNotHaveLbl.bottomAnchor, constant: 10),
            createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createBtn.heightAnchor.constraint(equalToConstant: 45),
            // Make it adaptive but with constraints
            createBtn.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            createBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            createBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            // Add bottom constraint to ensure it fits on screen
            createBtn.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    func setupPasswordToggle() {
        // Add eye icon for password visibility toggle
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passWordTxtField.rightView = eyeButton
        passWordTxtField.rightViewMode = .always
    }
    
    private func updateBottomBorders() {
        // Remove existing borders
        emailBottomBorder?.removeFromSuperlayer()
        passwordBottomBorder?.removeFromSuperlayer()
        
        // Add new borders with current frame width
        emailBottomBorder = CALayer()
        emailBottomBorder?.backgroundColor = UIColor.systemPurple.cgColor
        emailBottomBorder?.frame = CGRect(x: 0, y: emailTextField.frame.height - 1.5, width: emailTextField.frame.width, height: 1.5)
        emailTextField.layer.addSublayer(emailBottomBorder!)
        
        passwordBottomBorder = CALayer()
        passwordBottomBorder?.backgroundColor = UIColor.systemPurple.cgColor
        passwordBottomBorder?.frame = CGRect(x: 0, y: passWordTxtField.frame.height - 1.5, width: passWordTxtField.frame.width, height: 1.5)
        passWordTxtField.layer.addSublayer(passwordBottomBorder!)
    }
    
    @objc private func togglePasswordVisibility() {
        passWordTxtField.isSecureTextEntry.toggle()
        
        if let button = passWordTxtField.rightView as? UIButton {
            let imageName = passWordTxtField.isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
}








