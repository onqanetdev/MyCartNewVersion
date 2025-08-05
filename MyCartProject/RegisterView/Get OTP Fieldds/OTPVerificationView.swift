//
//  OTPVerificationView.swift
//  MyCartProject
//
//  Created by Onqanet on 04/08/25.
//

import UIKit

// MARK: - Delegate Protocol
protocol OTPVerificationViewDelegate: AnyObject {
    func didTapSubmitButton()
    func didTapSignUpButton()
    func didTapResendOTP()
}

class OTPVerificationView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: OTPVerificationViewDelegate?
    
    let wholeBackgroundImg = CustomSignUpImgView(imageName: "BGMain")
    let deliveryBoyImg = CustomSignUpImgView(imageName: "DeliveryIcon")
    //let iconImg = CustomSignUpImgView(imageName: "launch_Screen", cornerRadius: 5)
    
    let welcomeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Login" // Changed for OTP flow
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 30)
        return lbl
    }()
    

    lazy var userNmTxtFld = CustomTextField(
        placeholder: "9832451392",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: nil,
        eyeToggleSelector: nil,
        returnKeyType: .next,
        isHidden: false
    )
    
    lazy var otpTextField = CustomTextField(
        placeholder: "Enter OTP",
        isSecureField: false,
        addEyeButton: false,
        eyeButtonTarget: nil,
        eyeToggleSelector: nil,
        returnKeyType: .go,
        isHidden: false
    )
    
    lazy var submitBtn = CustomButton(
        title: "Submit",
        fontName: "Montserrat-Bold",
        fontSize: 24,
        backgroundColor: .loginBtn,
        titleColor: .white,
        cornerRadius: 15,
        target: self,
        action: #selector(submitButtonTapped)
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
    
    let resendOTPCtrl: UIControl = {
        let control = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let resendOTPLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Resend your OTP"
        lbl.font = UIFont(name: "Montserrat-Medium", size: 12)
        lbl.textColor = .detailView
        return lbl
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
    
    
    let checkMarkBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let squareImage = UIImage(systemName: "checkmark.square.fill")
        btn.setBackgroundImage(squareImage, for: .normal)
        btn.tintColor = .applyBtnProceed
        return btn
    }()
    
    let loginWithOTPLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Login with OTP"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Medium", size: 16)
        return lbl
    }()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
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
            deliveryBoyImg, welcomeLbl, userNmTxtFld,
            otpTextField, submitBtn, resendOTPCtrl, doNotHaveLbl, signUpBtn,
            checkMarkBtn, loginWithOTPLbl
        ]
        allSubviews.forEach { contentView.addSubview($0) }
        
        resendOTPCtrl.addSubview(resendOTPLbl)
        
        NSLayoutConstraint.activate([
            wholeBackgroundImg.topAnchor.constraint(equalTo: topAnchor),
            wholeBackgroundImg.leadingAnchor.constraint(equalTo: leadingAnchor),
            wholeBackgroundImg.trailingAnchor.constraint(equalTo: trailingAnchor),
            wholeBackgroundImg.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            deliveryBoyImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 135),
            deliveryBoyImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            deliveryBoyImg.widthAnchor.constraint(equalToConstant: 300),
            deliveryBoyImg.heightAnchor.constraint(equalToConstant: 140),
            
            welcomeLbl.topAnchor.constraint(equalTo: deliveryBoyImg.bottomAnchor, constant: 10),
            welcomeLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            
            userNmTxtFld.leadingAnchor.constraint(equalTo: welcomeLbl.leadingAnchor),
            userNmTxtFld.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            userNmTxtFld.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 60),
            userNmTxtFld.heightAnchor.constraint(equalToConstant: 40),
            
            checkMarkBtn.topAnchor.constraint(equalTo: userNmTxtFld.bottomAnchor, constant: 25),
            checkMarkBtn.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            checkMarkBtn.widthAnchor.constraint(equalToConstant: 25),
            checkMarkBtn.heightAnchor.constraint(equalToConstant: 25),
            
            loginWithOTPLbl.leadingAnchor.constraint(equalTo: checkMarkBtn.trailingAnchor, constant: 5),
            loginWithOTPLbl.centerYAnchor.constraint(equalTo: checkMarkBtn.centerYAnchor),
            loginWithOTPLbl.widthAnchor.constraint(equalToConstant: 145),
            
            
            otpTextField.topAnchor.constraint(equalTo: loginWithOTPLbl.bottomAnchor, constant: 25),
            otpTextField.leadingAnchor.constraint(equalTo: userNmTxtFld.leadingAnchor),
            otpTextField.trailingAnchor.constraint(equalTo: userNmTxtFld.trailingAnchor),
            otpTextField.heightAnchor.constraint(equalToConstant: 40),
            
            resendOTPLbl.topAnchor.constraint(equalTo: resendOTPCtrl.topAnchor),
            resendOTPLbl.leadingAnchor.constraint(equalTo: resendOTPCtrl.leadingAnchor),
            resendOTPLbl.trailingAnchor.constraint(equalTo: resendOTPCtrl.trailingAnchor),
            resendOTPLbl.bottomAnchor.constraint(equalTo: resendOTPCtrl.bottomAnchor),

            resendOTPCtrl.topAnchor.constraint(equalTo: otpTextField.bottomAnchor, constant: 12),
            resendOTPCtrl.trailingAnchor.constraint(equalTo: otpTextField.trailingAnchor),
            resendOTPCtrl.heightAnchor.constraint(equalToConstant: 20),
            
            submitBtn.topAnchor.constraint(equalTo: resendOTPCtrl.bottomAnchor, constant: 30),
            submitBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            submitBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            submitBtn.heightAnchor.constraint(equalToConstant: 50),
            
            doNotHaveLbl.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 30),
            doNotHaveLbl.leadingAnchor.constraint(equalTo: submitBtn.leadingAnchor),
            doNotHaveLbl.widthAnchor.constraint(equalToConstant: 205),
            
            signUpBtn.centerYAnchor.constraint(equalTo: doNotHaveLbl.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: doNotHaveLbl.trailingAnchor),
            signUpBtn.widthAnchor.constraint(equalToConstant: 65),
            signUpBtn.heightAnchor.constraint(equalToConstant: 30),
            
            contentView.bottomAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 40)
        ])
    }
    
    private func addTargets() {
        submitBtn.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        resendOTPCtrl.addTarget(self, action: #selector(resendOTPTapped), for: .touchUpInside)
    }
    
    // MARK: - Private Actions
    
    @objc private func submitButtonTapped() {
        delegate?.didTapSubmitButton()
    }
    
    @objc private func signUpButtonTapped() {
        delegate?.didTapSignUpButton()
    }
    
    @objc private func resendOTPTapped() {
        delegate?.didTapResendOTP()
    }
}



