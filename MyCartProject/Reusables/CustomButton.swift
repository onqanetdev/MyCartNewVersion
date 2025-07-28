//
//  CustomButton.swift
//  MyCartProject
//
//  Created by Onqanet on 25/07/25.
//

import UIKit

class CustomButton: UIButton {
    
    
    
    
    init(
        title: String,
        fontName: String = "Montserrat-Regular",
        fontSize: CGFloat = 16,
        backgroundColor: UIColor = .clear,
        titleColor: UIColor = .black,
        cornerRadius: CGFloat = 8,
        target: Any? = nil,
        action: Selector? = nil
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        if let font = UIFont(name: fontName, size: fontSize) {
            self.titleLabel?.font = font
        } else {
            self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        }
        
        if let action = action {
            self.addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
