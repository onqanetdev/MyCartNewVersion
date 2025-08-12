//
//  SectionBackgroundView.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class SectionBackgroundView: UICollectionReusableView {
    static let elementKind = "section-background-element"
    static var bottomCornerRadius: CGFloat = 0 // 👈 shared property
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill   // or .scaleToFill, as needed
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "header_background")
        return imageView
    }()

    
    
    
    
    override func layoutSubviews() {
            super.layoutSubviews()
            backgroundImageView.layer.cornerRadius = Self.bottomCornerRadius
            backgroundImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear  // So image is visible
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with image: UIImage?) {
        backgroundImageView.image = image
    }
    
}




