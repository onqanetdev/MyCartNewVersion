//
//  OrderHistoryTableViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 30/07/25.
//

import UIKit

class OrderHistoryTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "OrderHistoryTableViewCell"
    
    private var highlightedStars = 5
    
    
    
    var cellData : OrderHistoryModel? {
        didSet {
            guard let cellData = cellData else {return}
            orderImgView.image = UIImage(named: cellData.productImage)
            productName.text = cellData.productName
            productPrice.text = "Rs. " + cellData.productPrice + "/-"
            var rating = Int(cellData.productRating)!
            setupStarRatingView(starCount: rating)
        }
    }
    
    
    
    private let orderImgView: UIImageView = {
        let vw = UIImageView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 10
        vw.clipsToBounds = true
        vw.contentMode = .scaleToFill
        return vw
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    private let totalStars = 5
    //private var highlightedStars = 5

    private let productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let proceedBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.tintColor = .gray
        return btn
    }()
    
    
    private let bottomSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        //view.backgroundColor = .black
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpOrderHistory()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpOrderHistory() {
        addSubview(orderImgView)
        addSubview(productName)
        addSubview(starStackView)
        addSubview(productPrice)
        addSubview(proceedBtn)
        addSubview(bottomSeparator)
        
        setupStarRatingView(starCount: highlightedStars)
        
        NSLayoutConstraint.activate([
            // Image view constraints
            orderImgView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            orderImgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            orderImgView.widthAnchor.constraint(equalToConstant: 60),
            orderImgView.heightAnchor.constraint(equalToConstant: 60),
            
            // Product name constraints
            productName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            productName.leadingAnchor.constraint(equalTo: orderImgView.trailingAnchor, constant: 12),
            productName.trailingAnchor.constraint(equalTo: proceedBtn.leadingAnchor, constant: -8),
            
            // Product rating constraints
            starStackView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
            starStackView.leadingAnchor.constraint(equalTo: orderImgView.trailingAnchor, constant: 12),
            starStackView.heightAnchor.constraint(equalToConstant: 16),
            
            // Product price constraints
            productPrice.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 4),
            productPrice.leadingAnchor.constraint(equalTo: starStackView.leadingAnchor, constant: 4),
            productPrice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            // Proceed button constraints
            proceedBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            proceedBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            proceedBtn.widthAnchor.constraint(equalToConstant: 24),
            proceedBtn.heightAnchor.constraint(equalToConstant: 24),
            
            // Add these constraints after your existing ones:
            bottomSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            bottomSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupStarRatingView(starCount: Int) {
        // Clear existing stars
        starStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Update highlighted stars count
        highlightedStars = min(starCount, totalStars)
        
        // Add Stars
        for i in 0..<totalStars {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.tintColor = (i < highlightedStars) ? .systemYellow : .lightGray
            starImageView.image = UIImage(systemName: "star.fill")
            starStackView.addArrangedSubview(starImageView)
        }
    }
    
    // Configure cell with data
//    func configure(with productName: String, price: String, image: UIImage?, starRating: Int = 5) {
//        self.productName.text = productName
//        self.productPrice.text = price
//        self.orderImgView.image = image
//        setupStarRatingView(starCount: starRating)
//    }
    
    
}






