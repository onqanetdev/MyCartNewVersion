//
//  CustomTextField.swift
//  MyCartProject
//
//  Created by Onqanet on 25/07/25.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: - Properties
    private var eyeButton: UIButton?

    // MARK: - Init
    init(
        frame: CGRect = .zero,
        placeholder: String,
        isSecureField: Bool = false,
        addEyeButton: Bool = false,
        eyeButtonTarget: AnyObject? = nil,
        eyeToggleSelector: Selector? = nil,
        returnKeyType: UIReturnKeyType = .default,
        isHidden: Bool = false // ✅ Added
    ) {
        super.init(frame: frame)
        self.setupFieldView(
            placeholder: placeholder,
            isSecureField: isSecureField,
            addEyeButton: addEyeButton,
            target: eyeButtonTarget,
            action: eyeToggleSelector,
            returnKeyType: returnKeyType
        )
        
        self.isHidden = isHidden // ✅ Use it
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupFieldView(
        placeholder: String,
        isSecureField: Bool,
        addEyeButton: Bool,
        target: AnyObject?,
        action: Selector?,
        returnKeyType: UIReturnKeyType
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Montserrat-Regular", size: 16)
        self.textColor = .darkGray
        self.backgroundColor = .clear
        self.borderStyle = .none
        self.isSecureTextEntry = isSecureField
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.text = placeholder
        //self.returnKeyType = isSecureField ? .next : .go
        self.returnKeyType = returnKeyType

        // Border
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 8

        // Left padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always

        // Eye Button (optional)
        if addEyeButton {
            let eyeBtn = UIButton(type: .custom)
            eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            eyeBtn.tintColor = .gray
            eyeBtn.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            if let target = target, let action = action {
                eyeBtn.addTarget(target, action: action, for: .touchUpInside)
            }

            let container = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 25))
            eyeBtn.center = CGPoint(x: container.frame.width - 30, y: container.frame.height / 2)
            container.addSubview(eyeBtn)
            self.rightView = container

           // self.rightView = container
            self.rightViewMode = .always

            self.eyeButton = eyeBtn
        }
    }

    // MARK: - Public method to toggle secure entry
    func toggleSecureTextEntryState() {
        self.isSecureTextEntry.toggle()
        let imageName = self.isSecureTextEntry ? "eye.slash" : "eye"
        (self.eyeButton as? UIButton)?.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
