//
//  ProductReviewsCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 10/07/25.
//

import UIKit

class ProductReviewsCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "ProductReviewsCollectionViewCell"
    
    
    let reviewsView: UIView = {
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
    
    let reviewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Customer Reviews\n\n⭐⭐⭐⭐⭐ John D.\n'Great product! Highly recommended.'\n\n⭐⭐⭐⭐⭐ Sarah M.\n'Amazing quality and fast delivery.'\n\n⭐⭐⭐⭐⭐ Mike R.\n'Excellent value for money. Will buy again.'\n\n⭐⭐⭐⭐⭐ Lisa K.\n'Perfect! Exactly what I was looking for.'"
        label.numberOfLines = 0
        //label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        label.textColor = .label
        return label
    }()
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupContentViews()
        
        showReviewsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func setupContentViews() {
        reviewsView.addSubview(reviewsLabel)
        
        
        NSLayoutConstraint.activate([
        
            reviewsLabel.topAnchor.constraint(equalTo: reviewsView.topAnchor, constant: 16),
            reviewsLabel.leadingAnchor.constraint(equalTo: reviewsView.leadingAnchor, constant: 16),
            reviewsLabel.trailingAnchor.constraint(equalTo: reviewsView.trailingAnchor, constant: -16),
            reviewsLabel.bottomAnchor.constraint(lessThanOrEqualTo: reviewsView.bottomAnchor, constant: -16)
        ])
    }
    
    func showReviewsView() {
        
        // Add reviews view
        contentView.addSubview(reviewsView)
        
        NSLayoutConstraint.activate([
            reviewsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            reviewsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            reviewsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            reviewsView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}







