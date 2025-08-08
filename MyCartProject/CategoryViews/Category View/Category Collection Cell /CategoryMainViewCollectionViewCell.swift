//
//  CategoryMainViewCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 08/08/25.
//

import UIKit

class CategoryMainViewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    static let cellIdentifier = "CategoryMainViewCollectionViewCell"
    
    // Product image
    let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    // ADD Button
    let addButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("ADD", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return btn
    }()
    
    // Quantity label (e.g. "65 g")
    let quantityLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    // Veg/Non-veg icon
    let vegIconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vegfood")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5 // 10x10 -> radius = 5
        return iv
    }()
    
    // Product name
    let productNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        return lbl
    }()
    
    // Star rating stack view
    let starStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    // Sale off label
    let saleOffLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lbl.textColor = .systemGreen
        return lbl
    }()
    
    // Price label
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = .black
        return lbl
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        setupViews()
        setupConstraints()
        setupStars()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(addButton)
        
        let qtyStack = UIStackView(arrangedSubviews: [vegIconView, quantityLabel])
        qtyStack.axis = .horizontal
        qtyStack.spacing = 4
        qtyStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(qtyStack)
        
        contentView.addSubview(productNameLabel)
        contentView.addSubview(starStackView)
        
        let bottomStack = UIStackView(arrangedSubviews: [saleOffLabel, priceLabel])
        bottomStack.axis = .horizontal
        bottomStack.spacing = 6
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomStack)
        
        // Store bottom stack for constraints
        bottomStack.tag = 101
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Product image
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // ADD button
            addButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 6),
            addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 25),
            
            // Qty + veg icon stack
            vegIconView.widthAnchor.constraint(equalToConstant: 20),
            vegIconView.heightAnchor.constraint(equalToConstant: 20),
            vegIconView.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor , constant: -2),
            
            quantityLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 6),
            
            // Product name
            productNameLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 4),
            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            
            // Star stack
            starStackView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4),
            starStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            
            // Sale off + price
            contentView.viewWithTag(101)!.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 6),
            contentView.viewWithTag(101)!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            contentView.viewWithTag(101)!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    private func setupStars() {
        for _ in 0..<5 {
            let star = UIImageView(image: UIImage(systemName: "star.fill"))
            star.tintColor = .systemYellow
            star.contentMode = .scaleAspectFit
            star.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                star.widthAnchor.constraint(equalToConstant: 12),
                star.heightAnchor.constraint(equalToConstant: 12)
            ])
            starStackView.addArrangedSubview(star)
        }
    }
    
    // MARK: - Configure
    func configure(with model: CategoryModel) {
        productImageView.image = UIImage(named: model.productImgName)
        quantityLabel.text = model.productQuantity
        
//        vegIconView.image = UIImage(named: model.vegIconName)
        productNameLabel.text = model.productName
        saleOffLabel.text = model.percentOff
        priceLabel.text = model.productPrice
    }
}
