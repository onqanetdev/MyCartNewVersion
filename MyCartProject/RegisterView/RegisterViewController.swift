//
//  RegisterViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let wholeBackgroundImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 0
        img.image = UIImage(named: "BGMain")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    
    
    let iconImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.image = UIImage(named: "launch_Screen")
        img.contentMode = .scaleToFill
        return img
    }()
    
    let dottedImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "ellipsis")
        img.contentMode = .scaleToFill
        img.backgroundColor = .clear
       // img.tintColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        img.tintColor = .threeDotsColour
        return img
    }()
    
    
    let welcomeLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Welcome!"
       // lbl.textColor = #colorLiteral(red: 0.6745098039, green: 0.5019607843, blue: 0.8784313725, alpha: 1)
        lbl.textColor = .welcomeLblColour
        lbl.font = UIFont(name: "Montserrat-Bold", size: 48)
        return lbl
    }()
    
    
    let emailTextField: UITextField = {
        let textFld = UITextField()
        textFld.translatesAutoresizingMaskIntoConstraints = false
        textFld.font = UIFont(name: "Montserrat-Regular", size: 20)
        textFld.textColor = .black
        textFld.backgroundColor = .clear
        textFld.borderStyle = .none
        textFld.autocapitalizationType = .none
        textFld.autocorrectionType = .no
        
        textFld.text = "Email"
        textFld.returnKeyType = .next // ✅
        // Add bottom border
        let bottomBorder = CALayer()
        //bottomBorder.backgroundColor = UIColor.systemPurple.cgColor
        bottomBorder.backgroundColor = UIColor(named: "BottomLineColor")?.cgColor
        bottomBorder.frame = CGRect(x: 0, y: 43, width: 360, height: 1.5)
        textFld.layer.addSublayer(bottomBorder)
        
        return textFld
    }()
    
    
    let passWordTxtField: UITextField = {
        let textFld = UITextField()
        textFld.translatesAutoresizingMaskIntoConstraints = false
        textFld.font = UIFont(name: "Montserrat-Regular", size: 20)
        
        textFld.textColor = .black
        textFld.backgroundColor = .clear
        textFld.borderStyle = .none
        textFld.isSecureTextEntry = false
        textFld.autocapitalizationType = .none
        textFld.autocorrectionType = .no
        textFld.text = "Password"
        textFld.returnKeyType = .next // ✅
        // Add bottom border
        let bottomBorder = CALayer()
        //bottomBorder.backgroundColor = UIColor.systemPurple.cgColor
        bottomBorder.backgroundColor = UIColor(named: "BottomLineColor")?.cgColor
        bottomBorder.frame = CGRect(x: 0, y: 43, width: 360, height: 1.5)
        textFld.layer.addSublayer(bottomBorder)
        
        // Add eye icon for password visibility toggle
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        eyeButton.addTarget(textFld, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textFld.rightView = eyeButton
        textFld.rightViewMode = .always
        
        return textFld
    }()
    
    lazy var confirmPassWordTxtField: UITextField = {
        let textFld = UITextField()
        textFld.translatesAutoresizingMaskIntoConstraints = false
        textFld.font = UIFont(name: "Montserrat-Regular", size: 20)
        textFld.textColor = .black
        textFld.backgroundColor = .clear
        textFld.borderStyle = .none
        textFld.isSecureTextEntry = false
        textFld.autocapitalizationType = .none
        textFld.autocorrectionType = .no
        textFld.text = "Confirm Password"
        textFld.returnKeyType = .go // ✅
        // Add bottom border
        let bottomBorder = CALayer()
        //bottomBorder.backgroundColor = UIColor.systemPurple.cgColor
        bottomBorder.backgroundColor = UIColor(named: "BottomLineColor")?.cgColor
        bottomBorder.frame = CGRect(x: 0, y: 43, width: 360, height: 1.5)
        textFld.layer.addSublayer(bottomBorder)
        
        // Add eye icon for password visibility toggle
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .gray
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibilityForConfirmPassword), for: .touchUpInside)
        textFld.rightView = eyeButton
        textFld.rightViewMode = .always
        textFld.isHidden = true
        return textFld
    }()
    

    let loginBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(moveToTrendingProducts), for: .touchUpInside)
        btn.layer.cornerRadius = 25
        btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 24)
        //btn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        btn.backgroundColor = .loginBtn

        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 6
        btn.layer.masksToBounds = false
        return btn
    }()
    
    
    let forgetPasswordBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot Password ?", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 16)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let doNotHaveLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Don't have an account ?"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        return lbl
    }()
    
       
    let createBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Create", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 24)
        btn.layer.cornerRadius = 25
        //btn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        btn.backgroundColor = .createBtnColour
        btn.addTarget(self, action: #selector(moveToRegisterScreen), for: .touchUpInside)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 6
        btn.layer.masksToBounds = false
        
        return btn
    }()
    

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    var confirmPassWordTxtFieldHeightConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        
        
        emailTextField.delegate = self
        passWordTxtField.delegate = self
        confirmPassWordTxtField.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(wholeBackgroundImg)
        
        view.sendSubviewToBack(wholeBackgroundImg)
        
        
        setupScrollView()
        contentAdding()
        
        setUpWholeViewConstraints()
        setUpAllImageView()
        setUpLabels()
        setUpTexytFields()
        setupButtons()
        
        setupKeyboardHiding()
        
        
        
        
        for family in UIFont.familyNames {
            for name in UIFont.fontNames(forFamilyName: family) {
                print("Font: \(name)")
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    func setUpAllImageView(){
        
        contentView.addSubview(iconImg)
        
        NSLayoutConstraint.activate([
                iconImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                iconImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                iconImg.heightAnchor.constraint(equalToConstant: 120),
                iconImg.widthAnchor.constraint(equalToConstant: 120),
            
        ])
    }
    
    
    func setUpLabels() {
        
        
        NSLayoutConstraint.activate([
            dottedImg.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 30),
            dottedImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dottedImg.widthAnchor.constraint(equalToConstant: 35),
            dottedImg.heightAnchor.constraint(equalToConstant: 25),
            
            welcomeLbl.topAnchor.constraint(equalTo: dottedImg.bottomAnchor, constant: 10),
            welcomeLbl.leadingAnchor.constraint(equalTo: dottedImg.leadingAnchor, constant: 0),
            
        ])
        
    }
    
    
    
    func setUpTexytFields(){
        
        
        confirmPassWordTxtFieldHeightConstraint = confirmPassWordTxtField.heightAnchor.constraint(equalToConstant: 0)
        confirmPassWordTxtFieldHeightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: welcomeLbl.leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            passWordTxtField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            passWordTxtField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 0),
            passWordTxtField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 0),
            passWordTxtField.heightAnchor.constraint(equalToConstant: 50),
            
            
            confirmPassWordTxtField.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 5),
            confirmPassWordTxtField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 0),
            confirmPassWordTxtField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 0),
            //confirmPassWordTxtField.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        
    }
    
    
    func setupButtons(){
    
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: confirmPassWordTxtField.bottomAnchor, constant: 30),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
            
            forgetPasswordBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10),
            forgetPasswordBtn.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor),
            forgetPasswordBtn.trailingAnchor.constraint(equalTo: loginBtn.trailingAnchor),
            forgetPasswordBtn.heightAnchor.constraint(equalToConstant: 20),
            
            doNotHaveLbl.topAnchor.constraint(equalTo: forgetPasswordBtn.bottomAnchor, constant: 30),
            
            doNotHaveLbl.leadingAnchor.constraint(equalTo: forgetPasswordBtn.leadingAnchor, constant: 0),
            doNotHaveLbl.trailingAnchor.constraint(equalTo: forgetPasswordBtn.trailingAnchor, constant: 0),
            
            
    
            createBtn.topAnchor.constraint(equalTo: doNotHaveLbl.bottomAnchor, constant: 20),
            createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createBtn.widthAnchor.constraint(equalToConstant: 180),
            createBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        contentView.bottomAnchor.constraint(equalTo: createBtn.bottomAnchor, constant: 40).isActive = true
    }
    
    
    // func setupScrollView()
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), // ✅ this stays
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
           //contentView.bottomAnchor.constraint(equalTo: createBtn.bottomAnchor, constant: 40)
        ])
    }
    
    
    
    func setUpWholeViewConstraints(){
       // contentView.addSubview(wholeBackgroundImg)
        
        NSLayoutConstraint.activate([
            wholeBackgroundImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            wholeBackgroundImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            wholeBackgroundImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            wholeBackgroundImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    
    
    
    
    func contentAdding() {
       
       // view.addSubview(scrollView)
        [
         //topBackgroundImg, // ✅ Add this!
         dottedImg, welcomeLbl, emailTextField, passWordTxtField, confirmPassWordTxtField,  loginBtn, forgetPasswordBtn, doNotHaveLbl, createBtn].forEach { contentView.addSubview($0) }
    }
    
    
    
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
 //MARK: ALL the navigation Functions
    
    
    
    @objc private func togglePasswordVisibility() {
        passWordTxtField.isSecureTextEntry.toggle()
        
        if let button = passWordTxtField.rightView as? UIButton {
            let imageName = passWordTxtField.isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    @objc private func togglePasswordVisibilityForConfirmPassword() {
        confirmPassWordTxtField.isSecureTextEntry.toggle()
        
        if let button = confirmPassWordTxtField.rightView as? UIButton {
            let imageName = confirmPassWordTxtField.isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
        
    }
    
    
    
    @objc func  moveToTrendingProducts(){
        navigateToNextScreen()
    }
    
    @objc func moveToRegisterScreen(){
        
        if loginBtn.titleLabel?.text == "Login" {
            
            confirmPassWordTxtField.isHidden = false
            confirmPassWordTxtFieldHeightConstraint.constant = 50
            
            doNotHaveLbl.text = "Already Registered?"
            
            createBtn.setTitle("Login", for: .normal)
            loginBtn.setTitle("Registration", for: .normal)
            forgetPasswordBtn.isHidden = true
            
        } else {
            
            confirmPassWordTxtField.isHidden = true
            confirmPassWordTxtFieldHeightConstraint.constant = 0
            
            doNotHaveLbl.text = "Don't have an account?"
            
            createBtn.setTitle("Create", for: .normal)
            loginBtn.setTitle("Login", for: .normal)
            forgetPasswordBtn.isHidden = false
            
        }
        
    }
    
}





