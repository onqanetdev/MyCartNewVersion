//
//  UILabel+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 09/07/25.
//

import Foundation
import UIKit




extension UILabel {
    
    func setStrikethrough(text: String, color: UIColor = .black) {
        let attributedText = NSAttributedString(
            string: text,
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .strikethroughColor: color
            ])
        self.attributedText = attributedText
    }
    
    func setLineHeight(_ lineHeight: CGFloat) {
        guard let text = self.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineHeight
        attributeString.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, attributeString.length))
        self.attributedText = attributeString
    }
}
