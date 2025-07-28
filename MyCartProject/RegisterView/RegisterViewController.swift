//
//  RegisterViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class RegisterViewController: UIViewController {
    

    let wholeBackgroundImg = CustomSignUpImgView(imageName: "BGMain")
    let deliveryBoyImg = CustomSignUpImgView(imageName: "DeliveryIcon")
    let iconImg = CustomSignUpImgView(imageName: "launch_Screen", cornerRadius: 5)

    let welcomeLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Login"
       // lbl.textColor = #colorLiteral(red: 0.6745098039, green: 0.5019607843, blue: 0.8784313725, alpha: 1)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 30)
        return lbl
    }()
    

    lazy var userNmTxtFld = CustomTextField(
        placeholder: "User Name",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: self,
        eyeToggleSelector: #selector(togglePasswordVisibility),
        returnKeyType: .next,
        isHidden: false
    )
    
    lazy var userEmailIdTxtField = CustomTextField(
        placeholder: "Email ID",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: self,
        eyeToggleSelector: #selector(togglePasswordVisibility),
        returnKeyType: .next,
        isHidden: true
    )
    

    lazy var passWordTxtField = CustomTextField(
        placeholder: "Password",
        isSecureField: false,
        addEyeButton: true,
        eyeButtonTarget: self,
        eyeToggleSelector: #selector(togglePasswordVisibility),
        returnKeyType: .go,
        isHidden: false
    )

    lazy var confirmPassWordTxtField = CustomTextField(
        placeholder: "Confirm Password",
        isSecureField: false,
        addEyeButton: true,
        eyeButtonTarget: self,
        eyeToggleSelector: #selector(togglePasswordVisibility),
        returnKeyType: .go,
        isHidden: true
    )
    
    lazy var loginBtn = CustomButton(
        title: "Login",
        fontName: "Montserrat-Bold",
        fontSize: 24,
        backgroundColor: .loginBtn,
        titleColor: .white,
        cornerRadius: 15,
        target: self,
        action: #selector(moveToTrendingProducts)
    )

    lazy var signUpBtn = CustomButton(
        title: "Sign Up",
        fontName: "Montserrat-SemiBold",
        fontSize: 16,
        backgroundColor: .clear,
        titleColor: .descriptionBtnColour,
        cornerRadius: 0,
        target: self,
        action: #selector(moveToRegisterScreen)
    )

    
    
    
    let forgetPasswordBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot Password ?", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
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
        lbl.font = UIFont(name: "Montserrat-Medium", size: 16)
        
        return lbl
    }()
    
    
    

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    var confirmPassWordTxtFieldHeightConstraint: NSLayoutConstraint!

    var userEmailTxtFieldHeightConstraint: NSLayoutConstraint!
    
    var userEmailTopConstraint: NSLayoutConstraint!
    var confirmPasswordTopConstraint: NSLayoutConstraint!
    
    var loginBtnTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        
        
        userNmTxtFld.delegate = self
        passWordTxtField.delegate = self
        confirmPassWordTxtField.delegate = self
        userEmailIdTxtField.delegate = self
        
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
                iconImg.heightAnchor.constraint(equalToConstant: 105),
                iconImg.widthAnchor.constraint(equalToConstant: 105),
            
        ])
    }
    
    
    func setUpLabels() {
        
        
        NSLayoutConstraint.activate([
           
            deliveryBoyImg.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 10),
            deliveryBoyImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            deliveryBoyImg.widthAnchor.constraint(equalToConstant: 300),
            deliveryBoyImg.heightAnchor.constraint(equalToConstant: 180),
        
            welcomeLbl.topAnchor.constraint(equalTo: deliveryBoyImg.bottomAnchor, constant: 10),
            welcomeLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
        ])
        
    }
    
    
    
    func setUpTexytFields(){
        
        
        confirmPassWordTxtFieldHeightConstraint = confirmPassWordTxtField.heightAnchor.constraint(equalToConstant: 0)
        confirmPassWordTxtFieldHeightConstraint.isActive = true
        
        userEmailTxtFieldHeightConstraint = userEmailIdTxtField.heightAnchor.constraint(equalToConstant: 0)
        userEmailTxtFieldHeightConstraint.isActive = true
        
        userEmailTopConstraint = userEmailIdTxtField.topAnchor.constraint(equalTo: userNmTxtFld.bottomAnchor, constant: 0)
        confirmPasswordTopConstraint = confirmPassWordTxtField.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            userNmTxtFld.leadingAnchor.constraint(equalTo: welcomeLbl.leadingAnchor, constant: 0),
            userNmTxtFld.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userNmTxtFld.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 30),
            userNmTxtFld.heightAnchor.constraint(equalToConstant: 40),
            
        
            userEmailTopConstraint,
            userEmailIdTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor, constant: 0),
            userEmailIdTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor, constant: 0),
            
            
            passWordTxtField.topAnchor.constraint(equalTo: userEmailIdTxtField.bottomAnchor, constant: 25),
            passWordTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor, constant: 0),
            passWordTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor, constant: 0),
            passWordTxtField.heightAnchor.constraint(equalToConstant: 40),
            
            

            confirmPasswordTopConstraint,
            confirmPassWordTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor, constant: 0),
            confirmPassWordTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor, constant: 0),
            //confirmPassWordTxtField.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        
    }
    
    
    func setupButtons(){
        
        loginBtnTopConstraint = loginBtn.topAnchor.constraint(equalTo: confirmPassWordTxtField.bottomAnchor, constant: 70)
    
        NSLayoutConstraint.activate([
            loginBtnTopConstraint,
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
            
            forgetPasswordBtn.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 12),
            //forgetPasswordBtn.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor),
            forgetPasswordBtn.trailingAnchor.constraint(equalTo: passWordTxtField.trailingAnchor),
            forgetPasswordBtn.heightAnchor.constraint(equalToConstant: 20),
            forgetPasswordBtn.widthAnchor.constraint(equalToConstant: 130),
            
            
            
            doNotHaveLbl.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            
            doNotHaveLbl.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor, constant: 0),
            doNotHaveLbl.widthAnchor.constraint(equalToConstant: 205),
            
            
    
            signUpBtn.centerYAnchor.constraint(equalTo: doNotHaveLbl.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: doNotHaveLbl.trailingAnchor, constant: 0),
            signUpBtn.widthAnchor.constraint(equalToConstant: 65),
            signUpBtn.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        contentView.bottomAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 40).isActive = true
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
            
           
        ])
    }
    
    
    
    func setUpWholeViewConstraints(){
       
        NSLayoutConstraint.activate([
            wholeBackgroundImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            wholeBackgroundImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            wholeBackgroundImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            
            wholeBackgroundImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    
    func contentAdding() {
       
        [
            deliveryBoyImg,
       welcomeLbl, userNmTxtFld, userEmailIdTxtField, passWordTxtField, confirmPassWordTxtField,  loginBtn, forgetPasswordBtn, doNotHaveLbl, signUpBtn].forEach { contentView.addSubview($0) }
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
            
            passWordTxtField.returnKeyType = .next
            
            confirmPassWordTxtField.isHidden = false
            confirmPassWordTxtFieldHeightConstraint.constant = 40
            confirmPasswordTopConstraint.constant = 25
            
            userEmailIdTxtField.isHidden = false
            userEmailTxtFieldHeightConstraint.constant = 40
            userEmailTopConstraint.constant = 25
            
            
            doNotHaveLbl.text = "Already have an account ?"
            doNotHaveLbl.font = UIFont(name: "Montserrat-Medium", size: 15)
            signUpBtn.setTitle("Login", for: .normal)
            loginBtn.setTitle("Sign Up", for: .normal)
            forgetPasswordBtn.isHidden = true
            
            welcomeLbl.text = "Sign Up"
            loginBtnTopConstraint.constant = 35
            
        } else {
            
            passWordTxtField.returnKeyType = .go
            
            confirmPassWordTxtField.isHidden = true
            confirmPassWordTxtFieldHeightConstraint.constant = 0
            confirmPasswordTopConstraint.constant = 0
            
            userEmailIdTxtField.isHidden = true
            userEmailTxtFieldHeightConstraint.constant = 0
            userEmailTopConstraint.constant = 0
            
            doNotHaveLbl.text = "Don't have an account?"
            doNotHaveLbl.font = UIFont(name: "Montserrat-Medium", size: 16)
            signUpBtn.setTitle("Sign Up", for: .normal)
            loginBtn.setTitle("Login", for: .normal)
            forgetPasswordBtn.isHidden = false
            welcomeLbl.text = "Login"
            
            loginBtnTopConstraint.constant = 70
        }
        
    }
    
}







