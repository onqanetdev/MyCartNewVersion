//
//  AllProductsHeaderView.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class AllProductsHeaderView: UICollectionReusableView {
    
    static let headerIdentifier = "AllProductsHeaderView"
    
    // MARK: - UI Components
    private let containerView = UIView()
    private let hamburgerButton = UIButton(type: .system)
    private let cartButton = UIButton(type: .system)
    private let bellButton = UIButton(type: .system)
    private let deliveryLabel = UILabel()
    private let addressLabel = UILabel()
    public let searchBar = UIView()
    private let searchTextField = UITextField()
    private let searchIconImageView = UIImageView()
    
    private let locationView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pin_img")
        return imageView
    }()
    
    
    var onCartTapped: (() -> Void)?

    var onHamburgerTapped: (() -> Void)?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Methods
    private func setupView() {
        
        backgroundColor = .clear
        
        addSubview(containerView)
        
        
        containerView.backgroundColor = .clear
        
        
        containerView.addSubview(hamburgerButton)
        containerView.addSubview(cartButton)
        containerView.addSubview(bellButton)
        containerView.addSubview(deliveryLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(searchBar)
        
        containerView.addSubview(locationView)
        
        searchBar.addSubview(searchTextField)
        searchBar.addSubview(searchIconImageView)
        
        // Configure buttons
        setupButtons()
        setupLabels()
        setupSearchBar()
    }
    
    private func setupButtons() {
        // Hamburger menu button
        hamburgerButton.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        hamburgerButton.tintColor = .white
        hamburgerButton.addTarget(self, action: #selector(hamburgerTapped), for: .touchUpInside)
        
        // Cart button
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .white
        cartButton.addTarget(self, action: #selector(cartTapped), for: .touchUpInside)
        
        // Bell button
        bellButton.setImage(UIImage(systemName: "bell"), for: .normal)
        bellButton.tintColor = .white
        bellButton.addTarget(self, action: #selector(bellTapped), for: .touchUpInside)
    }
    
    private func setupLabels() {
        // Delivery label
        deliveryLabel.text = "Delivery in 10 Minutes"
        //deliveryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        deliveryLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        deliveryLabel.textColor = .black
        
        // Address label
        addressLabel.text = "WORK - 903, 9th Floor, Primarc Tower"
        //addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.font = UIFont(name: "Montserrat-Bold", size: 14)
        addressLabel.textColor = UIColor.white.withAlphaComponent(0.9)
        addressLabel.numberOfLines = 1
    }
    
    private func setupSearchBar() {
        //searchBar.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchBar.backgroundColor = #colorLiteral(red: 0.6111966968, green: 0.4623382688, blue: 0.8610779643, alpha: 1)
        searchBar.layer.cornerRadius = 15
        searchBar.layer.masksToBounds = true
        
        // Search text field
        searchTextField.placeholder = "Let's search your needs"
        searchTextField.textColor = .white
        //searchTextField.font = UIFont.systemFont(ofSize: 16)
        searchTextField.font = UIFont(name: "Montserrat-Medium", size: 16)
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        
        // Placeholder color
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Let's search your needs",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
        )
        
        // Search icon
        searchIconImageView.image = UIImage(systemName: "magnifyingglass")
        searchIconImageView.tintColor = UIColor.white.withAlphaComponent(0.7)
        searchIconImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        hamburgerButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchIconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Container view
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Hamburger button
            hamburgerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            hamburgerButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 56),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 24),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Cart button
            cartButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            cartButton.centerYAnchor.constraint(equalTo: hamburgerButton.centerYAnchor),
            cartButton.widthAnchor.constraint(equalToConstant: 24),
            cartButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Bell button
            bellButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -16),
            bellButton.centerYAnchor.constraint(equalTo: hamburgerButton.centerYAnchor),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Delivery label
            deliveryLabel.leadingAnchor.constraint(equalTo: hamburgerButton.leadingAnchor, constant: 0),
            deliveryLabel.topAnchor.constraint(equalTo: hamburgerButton.bottomAnchor, constant: 14),
            deliveryLabel.trailingAnchor.constraint(lessThanOrEqualTo: bellButton.leadingAnchor, constant: -8),
            
            //Location View
            locationView.leadingAnchor.constraint(equalTo: hamburgerButton.leadingAnchor, constant: 0),
            locationView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 5),
            locationView.widthAnchor.constraint(equalToConstant: 20),
            locationView.heightAnchor.constraint(equalToConstant: 20),
            
            
            
            // Address label
            addressLabel.leadingAnchor.constraint(equalTo: locationView.trailingAnchor, constant: 6),
            addressLabel.centerYAnchor.constraint(equalTo: locationView.centerYAnchor, constant: 0),
            //addressLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 5),
            addressLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -16),
            
            // Search bar
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            searchBar.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            //searchBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            // Search text field
            searchTextField.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 20),
            searchTextField.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchIconImageView.leadingAnchor, constant: -12),
            
            // Search icon
            searchIconImageView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -20),
            searchIconImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchIconImageView.widthAnchor.constraint(equalToConstant: 20),
            searchIconImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update gradient frame when view layout changes
        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }
    
    // MARK: - Action Methods
    @objc private func hamburgerTapped() {
        print("Hamburger menu tapped")
        // Add your hamburger menu action here
        onHamburgerTapped?()
    }
    
    @objc private func cartTapped() {
        print("Cart tapped")
        // Add your cart action here
        onCartTapped?()
    }
    
    @objc private func bellTapped() {
        print("Bell notification tapped")
        // Add your notification action here
        
    }
    
    
}
