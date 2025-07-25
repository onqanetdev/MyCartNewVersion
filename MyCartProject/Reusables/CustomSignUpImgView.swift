//
//  CustomSignUpImgView.swift
//  MyCartProject
//
//  Created by Onqanet on 25/07/25.
//

import UIKit

class CustomSignUpImgView: UIImageView {
    init(imageName: String, cornerRadius: CGFloat = 0) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
