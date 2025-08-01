//
//  UIImage+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit



extension UIImageView {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func sample(_ topic: String, _ subtopic: String, _ index: Int) {

        let size = CGSize(width: 1, height: 1)
        let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.lightGray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        self.image = placeholder
    }
}
