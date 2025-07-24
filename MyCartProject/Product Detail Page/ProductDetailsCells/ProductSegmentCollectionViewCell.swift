//
//  ProductSegmentCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 10/07/25.
//

import UIKit




class ProductSegmentCollectionViewCell: UICollectionViewCell {
    
    
    
    static let cellIdentifier = "ProductSegmentCollectionViewCell"
    
    
    let descriptionBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Description", for: .normal)
        btn.titleLabel?.font =  UIFont(name: "Montserrat-SemiBold", size: 20)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 15
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
        btn.backgroundColor = .descriptionBtnColour
        btn.addTarget(self, action: #selector(changingSegmentsDescription), for: .touchUpInside)
        
        return btn
    }()
    
    
    let reviewsBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Reviews", for: .normal)
        btn.titleLabel?.font =  UIFont(name: "Montserrat-SemiBold", size: 20)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 15
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(changingSegmentsReviews), for: .touchUpInside)
        return btn
    }()
    
    
    
    let straightLine:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        return view
    }()
    
    
    let segmentContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        // view.layer.cornerRadius = 12
        return view
    }()
    
    
    var onDescriptionTapped: (() -> Void)?
    var onReviewsTapped: (() -> Void)?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViewSegmentViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setUpViewSegmentViews(){
        contentView.addSubview(segmentContainerView)
        segmentContainerView.addSubview(descriptionBtn)
        segmentContainerView.addSubview(reviewsBtn)
        contentView.addSubview(straightLine)
        
        
        NSLayoutConstraint.activate([
            
            segmentContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            segmentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            segmentContainerView.widthAnchor.constraint(equalToConstant: 340),
            segmentContainerView.heightAnchor.constraint(equalToConstant: 70),
            
            
            
            descriptionBtn.leadingAnchor.constraint(equalTo: segmentContainerView.leadingAnchor, constant: 15),
            descriptionBtn.topAnchor.constraint(equalTo: segmentContainerView.topAnchor, constant: 10),
            descriptionBtn.widthAnchor.constraint(equalToConstant: 150),
            descriptionBtn.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            reviewsBtn.leadingAnchor.constraint(equalTo: descriptionBtn.trailingAnchor, constant: 10),
            reviewsBtn.topAnchor.constraint(equalTo: descriptionBtn.topAnchor),
            reviewsBtn.widthAnchor.constraint(equalToConstant: 150),
            reviewsBtn.heightAnchor.constraint(equalToConstant: 50),
            
            
            straightLine.topAnchor.constraint(equalTo: reviewsBtn.bottomAnchor, constant: 0),
            straightLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            straightLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            straightLine.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    
    
    
    @objc func changingSegmentsDescription(){
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            //self.descriptionBtn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
            self.descriptionBtn.backgroundColor = .descriptionBtnColour
            self.descriptionBtn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            
            self.reviewsBtn.backgroundColor = .white
            self.reviewsBtn.transform = CGAffineTransform.identity
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.descriptionBtn.transform = CGAffineTransform.identity
            }
        }
        
        // Animate title color changes
        UIView.transition(with: descriptionBtn, duration: 0.3, options: .transitionCrossDissolve) {
            self.descriptionBtn.setTitleColor(.white, for: .normal)
        }
        
        UIView.transition(with: reviewsBtn, duration: 0.3, options: .transitionCrossDissolve) {
            self.reviewsBtn.setTitleColor(.black, for: .normal)
        }
        
        
        
        // ✅ Call the closure
        onDescriptionTapped?()
        
    }
    
    
    
    @objc func changingSegmentsReviews(){
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
            self.reviewsBtn.backgroundColor = .descriptionBtnColour
            self.reviewsBtn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            
            self.descriptionBtn.backgroundColor = .white
            self.descriptionBtn.transform = CGAffineTransform.identity
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.reviewsBtn.transform = CGAffineTransform.identity
            }
        }
        
        // Animate title color changes
        UIView.transition(with: reviewsBtn, duration: 0.3, options: .transitionCrossDissolve) {
            self.reviewsBtn.setTitleColor(.white, for: .normal)
        }
        
        UIView.transition(with: descriptionBtn, duration: 0.3, options: .transitionCrossDissolve) {
            self.descriptionBtn.setTitleColor(.black, for: .normal)
        }
        
        
        // ✅ Call the closure
               onReviewsTapped?()
        
        
    }
}



//class ProductSegmentCollectionViewCell: UICollectionViewCell {
//
//
//
//    static let cellIdentifier = "ProductSegmentCollectionViewCell"
//
//
//    let descriptionBtn:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle("Description", for: .normal)
//        btn.setTitleColor(.white, for: .normal)
//        btn.layer.cornerRadius = 15
//        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
//        btn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
//        btn.addTarget(self, action: #selector(changingSegmentsDescription), for: .touchUpInside)
//
//        return btn
//    }()
//
//
//    func setupContentViews() {
//        // Setup description view
//        descriptionView.addSubview(descriptionLabel)
//
//        // Setup reviews view
//        reviewsView.addSubview(reviewsLabel)
//
//        NSLayoutConstraint.activate([
//            // Description label constraints
//            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 16),
//            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16),
//            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionView.bottomAnchor, constant: -16),
//
//            // Reviews label constraints
//            reviewsLabel.topAnchor.constraint(equalTo: reviewsView.topAnchor, constant: 16),
//            reviewsLabel.leadingAnchor.constraint(equalTo: reviewsView.leadingAnchor, constant: 16),
//            reviewsLabel.trailingAnchor.constraint(equalTo: reviewsView.trailingAnchor, constant: -16),
//            reviewsLabel.bottomAnchor.constraint(lessThanOrEqualTo: reviewsView.bottomAnchor, constant: -16)
//        ])
//    }
//
//
//    func showDescriptionView() {
//        // Remove reviews view if it exists
//        reviewsView.removeFromSuperview()
//
//        // Add description view
//        contentView.addSubview(descriptionView)
//
//        NSLayoutConstraint.activate([
//            descriptionView.topAnchor.constraint(equalTo: straightLine.bottomAnchor, constant: 10),
//            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            descriptionView.heightAnchor.constraint(equalToConstant: 150)
//        ])
//    }
//
//
//    func showReviewsView() {
//        // Remove description view if it exists
//        descriptionView.removeFromSuperview()
//
//        // Add reviews view
//        contentView.addSubview(reviewsView)
//
//        NSLayoutConstraint.activate([
//            reviewsView.topAnchor.constraint(equalTo: straightLine.bottomAnchor, constant: 10),
//            reviewsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            reviewsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            reviewsView.heightAnchor.constraint(equalToConstant: 300)
//        ])
//    }
//
//
//    let reviewsBtn: UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setTitle("Reviews", for: .normal)
//        btn.setTitleColor(.black, for: .normal)
//        btn.layer.cornerRadius = 15
//        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
//        btn.backgroundColor = .white
//        btn.addTarget(self, action: #selector(changingSegmentsReviews), for: .touchUpInside)
//        return btn
//    }()
//
//
//
//    let straightLine:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemPurple
//        return view
//    }()
//
//
//    let segmentContainerView:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//       // view.layer.cornerRadius = 12
//        return view
//    }()
//
//
//    let descriptionView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemBackground
//        view.layer.cornerRadius = 12
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 4
//        return view
//    }()
//
//
//    let reviewsView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemBackground
//        view.layer.cornerRadius = 12
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.1
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 4
//        return view
//    }()
//
//
//    let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Product Description\n\nThis is where the detailed product description will be displayed. It contains information about the product features, specifications, and other relevant details."
//        label.numberOfLines = 0
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textColor = .label
//        return label
//    }()
//
//
//    let reviewsLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Customer Reviews\n\n⭐⭐⭐⭐⭐ John D.\n'Great product! Highly recommended.'\n\n⭐⭐⭐⭐⭐ Sarah M.\n'Amazing quality and fast delivery.'\n\n⭐⭐⭐⭐⭐ Mike R.\n'Excellent value for money. Will buy again.'\n\n⭐⭐⭐⭐⭐ Lisa K.\n'Perfect! Exactly what I was looking for.'"
//        label.numberOfLines = 0
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textColor = .label
//        return label
//    }()
//
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//       setUpViewSegmentViews()
//       setupContentViews()
//       showDescriptionView() // Show description view by default
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//
//
//    func setUpViewSegmentViews(){
//        contentView.addSubview(segmentContainerView)
//        segmentContainerView.addSubview(descriptionBtn)
//        segmentContainerView.addSubview(reviewsBtn)
//        contentView.addSubview(straightLine)
//
//
//        NSLayoutConstraint.activate([
//
//            segmentContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            segmentContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            segmentContainerView.widthAnchor.constraint(equalToConstant: 340),
//            segmentContainerView.heightAnchor.constraint(equalToConstant: 70),
//
//
//
//            descriptionBtn.leadingAnchor.constraint(equalTo: segmentContainerView.leadingAnchor, constant: 15),
//            descriptionBtn.topAnchor.constraint(equalTo: segmentContainerView.topAnchor, constant: 10),
//            descriptionBtn.widthAnchor.constraint(equalToConstant: 150),
//            descriptionBtn.heightAnchor.constraint(equalToConstant: 50),
//
//
//
//            reviewsBtn.leadingAnchor.constraint(equalTo: descriptionBtn.trailingAnchor, constant: 10),
//            reviewsBtn.topAnchor.constraint(equalTo: descriptionBtn.topAnchor),
//            reviewsBtn.widthAnchor.constraint(equalToConstant: 150),
//            reviewsBtn.heightAnchor.constraint(equalToConstant: 50),
//
//
//            straightLine.topAnchor.constraint(equalTo: reviewsBtn.bottomAnchor, constant: -3),
//            straightLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
//            straightLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//
//            straightLine.heightAnchor.constraint(equalToConstant: 1),
//
//        ])
//    }
//
//
//
//    @objc func changingSegmentsDescription(){
//
//        // Show description view
//        showDescriptionView()
//
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
//            self.descriptionBtn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
//            self.descriptionBtn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
//
//            self.reviewsBtn.backgroundColor = .white
//            self.reviewsBtn.transform = CGAffineTransform.identity
//        } completion: { _ in
//            UIView.animate(withDuration: 0.1) {
//                self.descriptionBtn.transform = CGAffineTransform.identity
//            }
//        }
//
//        // Animate title color changes
//        UIView.transition(with: descriptionBtn, duration: 0.3, options: .transitionCrossDissolve) {
//            self.descriptionBtn.setTitleColor(.white, for: .normal)
//        }
//
//        UIView.transition(with: reviewsBtn, duration: 0.3, options: .transitionCrossDissolve) {
//            self.reviewsBtn.setTitleColor(.black, for: .normal)
//        }
//
//    }
//
//
//
//    @objc func changingSegmentsReviews(){
//
//        // Show reviews view
//        showReviewsView()
//
//        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut) {
//            self.reviewsBtn.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
//            self.reviewsBtn.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
//
//            self.descriptionBtn.backgroundColor = .white
//            self.descriptionBtn.transform = CGAffineTransform.identity
//        } completion: { _ in
//            UIView.animate(withDuration: 0.1) {
//                self.reviewsBtn.transform = CGAffineTransform.identity
//            }
//        }
//
//        // Animate title color changes
//        UIView.transition(with: reviewsBtn, duration: 0.3, options: .transitionCrossDissolve) {
//            self.reviewsBtn.setTitleColor(.white, for: .normal)
//        }
//
//        UIView.transition(with: descriptionBtn, duration: 0.3, options: .transitionCrossDissolve) {
//            self.descriptionBtn.setTitleColor(.black, for: .normal)
//        }
//
//    }
//
//}
