//
//  RegisterView.swift
//  MyCartProject
//
//  Created by Onqanet on 04/08/25.
//

import UIKit

class RegisterView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: RegisterViewDelegate?
    
    let wholeBackgroundImg = CustomSignUpImgView(imageName: "BGMain")
    let deliveryBoyImg = CustomSignUpImgView(imageName: "DeliveryIcon")
    //let iconImg = CustomSignUpImgView(imageName: "", cornerRadius: 5)
    
    let welcomeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Login"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 30)
        return lbl
    }()
    
    let orLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "or"
        lbl.textColor = .descriptionBtnColour
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        return lbl
    }()
    
    let checkMarkBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let squareImage = UIImage(systemName: "square")
        btn.setBackgroundImage(squareImage, for: .normal)
        btn.tintColor = .darkGray
        return btn
    }()
    
    let loginWithOTPLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "LOGIN WITH OTP"
        lbl.textColor = .darkGray
        lbl.font = UIFont(name: "Montserrat-Medium", size: 14)
        return lbl
    }()
    
    lazy var userNmTxtFld = CustomTextField(
        placeholder: "User Name",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: nil,
        eyeToggleSelector: nil,
        returnKeyType: .next,
        isHidden: false
    )
    
    lazy var userEmailIdTxtField = CustomTextField(
        placeholder: "Email ID",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: nil,
        eyeToggleSelector: nil,
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
        eyeToggleSelector: #selector(togglePasswordVisibilityForConfirmPassword),
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
        action: #selector(loginButtonTapped)
    )
    
    lazy var signUpBtn = CustomButton(
        title: "Sign Up",
        fontName: "Montserrat-SemiBold",
        fontSize: 16,
        backgroundColor: .clear,
        titleColor: .descriptionBtnColour,
        cornerRadius: 0,
        target: self,
        action: #selector(signUpButtonTapped)
    )
    
    let forgetPasswordBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Forgot Password ?", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    let doNotHaveLbl: UILabel = {
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

    private var confirmPassWordTxtFieldHeightConstraint: NSLayoutConstraint!
    private var userEmailTxtFieldHeightConstraint: NSLayoutConstraint!
    private var userEmailTopConstraint: NSLayoutConstraint!
    private var confirmPasswordTopConstraint: NSLayoutConstraint!
    private var passwordTextFieldTopConstraint: NSLayoutConstraint!
    private var passwordTextFieldHeightConstraint: NSLayoutConstraint!
    private var loginBtnTopConstraint: NSLayoutConstraint!
    private var orLabelTopConstraint: NSLayoutConstraint!
    private var forgetPasswordTopConstraint: NSLayoutConstraint!
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        addSubview(wholeBackgroundImg)
        sendSubviewToBack(wholeBackgroundImg)
        setupScrollView()
        addTargets()
        setupConstraints()
        
        // Initial state is "Login"
        configureForLoginState()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func setupConstraints() {
        let allSubviews: [UIView] = [
             deliveryBoyImg, welcomeLbl, userNmTxtFld, userEmailIdTxtField,
            passWordTxtField, confirmPassWordTxtField, loginBtn, forgetPasswordBtn,
            doNotHaveLbl, signUpBtn, orLabel, checkMarkBtn, loginWithOTPLbl
        ]
        allSubviews.forEach { contentView.addSubview($0) }
        
        // --- Setting up variable constraints first ---
        confirmPassWordTxtFieldHeightConstraint = confirmPassWordTxtField.heightAnchor.constraint(equalToConstant: 0)
        userEmailTxtFieldHeightConstraint = userEmailIdTxtField.heightAnchor.constraint(equalToConstant: 0)
        userEmailTopConstraint = userEmailIdTxtField.topAnchor.constraint(equalTo: userNmTxtFld.bottomAnchor, constant: 0)
        confirmPasswordTopConstraint = confirmPassWordTxtField.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 0)
        passwordTextFieldTopConstraint = passWordTxtField.topAnchor.constraint(equalTo: userEmailIdTxtField.bottomAnchor, constant: 25)
        passwordTextFieldHeightConstraint = passWordTxtField.heightAnchor.constraint(equalToConstant: 40)
        loginBtnTopConstraint = loginBtn.topAnchor.constraint(equalTo: confirmPassWordTxtField.bottomAnchor, constant: 70)
        
        orLabelTopConstraint = orLabel.topAnchor.constraint(equalTo: forgetPasswordBtn.topAnchor, constant: 2) // Corrected
        
        forgetPasswordTopConstraint = forgetPasswordBtn.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 12)
        
        NSLayoutConstraint.activate([
            wholeBackgroundImg.topAnchor.constraint(equalTo: topAnchor),
            wholeBackgroundImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            wholeBackgroundImg.trailingAnchor.constraint(equalTo: trailingAnchor),
            wholeBackgroundImg.bottomAnchor.constraint(equalTo: bottomAnchor),
            

            
            deliveryBoyImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 135),
            deliveryBoyImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            deliveryBoyImg.widthAnchor.constraint(equalToConstant: 300),
            deliveryBoyImg.heightAnchor.constraint(equalToConstant: 160),
            
            welcomeLbl.topAnchor.constraint(equalTo: deliveryBoyImg.bottomAnchor, constant: 10),
            welcomeLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            userNmTxtFld.leadingAnchor.constraint(equalTo: welcomeLbl.leadingAnchor),
            userNmTxtFld.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            userNmTxtFld.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 30),
            userNmTxtFld.heightAnchor.constraint(equalToConstant: 40),
            
            userEmailTopConstraint,
            userEmailTxtFieldHeightConstraint,
            userEmailIdTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            userEmailIdTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor),
            
            passwordTextFieldTopConstraint,
            passwordTextFieldHeightConstraint,
            passWordTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            passWordTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor),
            
            confirmPasswordTopConstraint,
            confirmPassWordTxtFieldHeightConstraint,
            confirmPassWordTxtField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            confirmPassWordTxtField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor),
            
            loginBtnTopConstraint,
            loginBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            loginBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            loginBtn.heightAnchor.constraint(equalToConstant: 50),
            
//            forgetPasswordBtn.topAnchor.constraint(equalTo: passWordTxtField.bottomAnchor, constant: 12),
            forgetPasswordTopConstraint,
            forgetPasswordBtn.trailingAnchor.constraint(equalTo: passWordTxtField.trailingAnchor),
            forgetPasswordBtn.heightAnchor.constraint(equalToConstant: 20),
            forgetPasswordBtn.widthAnchor.constraint(equalToConstant: 130),
            
            orLabelTopConstraint,
            orLabel.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            
            checkMarkBtn.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 3),
            checkMarkBtn.leadingAnchor.constraint(equalTo: orLabel.leadingAnchor),
            checkMarkBtn.widthAnchor.constraint(equalToConstant: 25),
            checkMarkBtn.heightAnchor.constraint(equalToConstant: 25),
            
            loginWithOTPLbl.leadingAnchor.constraint(equalTo: checkMarkBtn.trailingAnchor, constant: 5),
            loginWithOTPLbl.centerYAnchor.constraint(equalTo: checkMarkBtn.centerYAnchor),
            loginWithOTPLbl.widthAnchor.constraint(equalToConstant: 145),
            
            doNotHaveLbl.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            doNotHaveLbl.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor),
            doNotHaveLbl.widthAnchor.constraint(equalToConstant: 205),
            
            signUpBtn.centerYAnchor.constraint(equalTo: doNotHaveLbl.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: doNotHaveLbl.trailingAnchor),
            signUpBtn.widthAnchor.constraint(equalToConstant: 65),
            signUpBtn.heightAnchor.constraint(equalToConstant: 30),
            
            contentView.bottomAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 40)
        ])
    }
    
    private func addTargets() {
        checkMarkBtn.addTarget(self, action: #selector(checkmarkButtonTapped), for: .touchUpInside)
        forgetPasswordBtn.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
    }
    
    // MARK: - State Management
    
    func configureForLoginState() {
        welcomeLbl.text = "Login"
        loginBtn.setTitle("Login", for: .normal)
        doNotHaveLbl.text = "Don't have an account?"
        doNotHaveLbl.font = UIFont(name: "Montserrat-Medium", size: 16)
        signUpBtn.setTitle("Sign Up", for: .normal)
        
        userEmailIdTxtField.isHidden = true
        userEmailTxtFieldHeightConstraint.constant = 0
        userEmailTopConstraint.constant = 0
        
        confirmPassWordTxtField.isHidden = true
        confirmPassWordTxtFieldHeightConstraint.constant = 0
        confirmPasswordTopConstraint.constant = 0
        
        passWordTxtField.returnKeyType = .go
        forgetPasswordBtn.isHidden = false
        
        loginBtnTopConstraint.constant = 70
        
         
        orLabelTopConstraint.isActive = true
        forgetPasswordTopConstraint.isActive = true
        orLabel.isHidden = false
        checkMarkBtn.isHidden = false
        loginWithOTPLbl.isHidden = false
        
        // Reset OTP state
        configureForPasswordLogin()
    }
    
    func configureForSignUpState() {
        welcomeLbl.text = "Sign Up"
        loginBtn.setTitle("Sign Up", for: .normal)
        doNotHaveLbl.text = "Already have an account ?"
        doNotHaveLbl.font = UIFont(name: "Montserrat-Medium", size: 15)
        signUpBtn.setTitle("Login", for: .normal)
        
        userEmailIdTxtField.isHidden = false
        userEmailTxtFieldHeightConstraint.constant = 40
        userEmailTopConstraint.constant = 25
        
        confirmPassWordTxtField.isHidden = false
        confirmPassWordTxtFieldHeightConstraint.constant = 40
        confirmPasswordTopConstraint.constant = 25
        passWordTxtField.returnKeyType = .next
    
        loginBtnTopConstraint.constant = 35
        
        orLabel.isHidden = true
        forgetPasswordBtn.isHidden = true
        
        orLabelTopConstraint.isActive = false
        forgetPasswordTopConstraint.isActive = false
        checkMarkBtn.isHidden = true
        loginWithOTPLbl.isHidden = true
        // Reset OTP state
        configureForPasswordLogin()
    }
    
    func configureForOTPLogin() {
        loginBtn.setTitle("Get OTP", for: .normal)
        
        passwordTextFieldTopConstraint.constant = 0
        passwordTextFieldHeightConstraint.constant = 0
        passWordTxtField.isHidden = true
        
        forgetPasswordBtn.isHidden = true
        orLabel.isHidden = true
        userNmTxtFld.text = "Mobile No."
        checkMarkBtn.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        checkMarkBtn.tintColor = .detailView
    }
    
    func configureForPasswordLogin() {
        loginBtn.setTitle("Login", for: .normal)
        
        passwordTextFieldTopConstraint.constant = 25
        passwordTextFieldHeightConstraint.constant = 40
        passWordTxtField.isHidden = false
        
        forgetPasswordBtn.isHidden = false
        orLabel.isHidden = false
        userNmTxtFld.text = "Username"
        checkMarkBtn.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        checkMarkBtn.tintColor = .darkGray
    }
    
    // MARK: - Private Actions
    
    @objc private func loginButtonTapped() {
        delegate?.didTapLoginButton()
    }
    
    @objc private func signUpButtonTapped() {
        
        delegate?.didTapSignUpButton()
    }
    
    @objc private func forgotPasswordTapped() {
        delegate?.didTapForgotPassword()
    }
    
    @objc private func checkmarkButtonTapped() {
        let isChecked = checkMarkBtn.backgroundImage(for: .normal) == UIImage(systemName: "square")
        delegate?.didToggleCheckmark(isChecked: isChecked)
    }
    
    @objc private func togglePasswordVisibility() {
        passWordTxtField.isSecureTextEntry.toggle()
        let imageName = passWordTxtField.isSecureTextEntry ? "eye.slash" : "eye"
        (passWordTxtField.rightView as? UIButton)?.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func togglePasswordVisibilityForConfirmPassword() {
        confirmPassWordTxtField.isSecureTextEntry.toggle()
        let imageName = confirmPassWordTxtField.isSecureTextEntry ? "eye.slash" : "eye"
        (confirmPassWordTxtField.rightView as? UIButton)?.setImage(UIImage(systemName: imageName), for: .normal)
    }
}



