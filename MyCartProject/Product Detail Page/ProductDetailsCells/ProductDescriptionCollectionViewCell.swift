//
//  ProductDescriptionCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 10/07/25.
//

import UIKit

class ProductDescriptionCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "ProductDescriptionCollectionViewCell"
    
    
    
    let descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product Description\n\nThis is where the detailed product description will be displayed. It contains information about the product features, specifications, and other relevant details."
        label.numberOfLines = 0
       // label.font = UIFont.systemFont(ofSize: 16)
        label.font =  UIFont(name: "Montserrat-SemiBold", size: 16)
        label.textColor = .label
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentViews()
        
        showDescriptionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupContentViews() {
        // Setup description view
        descriptionView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            // Description label constraints
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionView.bottomAnchor, constant: -16),
        ])
    }
    
    
    
    
    
    func showDescriptionView() {
        // Add description view
        contentView.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}


