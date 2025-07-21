//
//  UITextField+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit




extension UITextField {
    @objc func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        
        if let button = rightView as? UIButton {
            let imageName = isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
}
