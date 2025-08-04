//
//  RegisterDelegate.swift
//  MyCartProject
//
//  Created by Onqanet on 04/08/25.
//


import Foundation
import UIKit


protocol RegisterViewDelegate: AnyObject {
    func didTapLoginButton()
    func didTapSignUpButton()
    func didTapForgotPassword()
    func didToggleCheckmark(isChecked: Bool)
}
