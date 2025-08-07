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
    
    private let locationView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pin_img")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - Closures
    var onCartTapped: (() -> Void)?
    var onHamburgerTapped: (() -> Void)?
    var onBellIconTapped: (() -> Void)?
    
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
        
        // Add the searchTextField to the searchBar container
        searchBar.addSubview(searchTextField)
        
        // Configure components
        setupButtons()
        setupLabels()
        setupSearchBar()
    }
    
    private func setupButtons() {
        // Hamburger menu button
        hamburgerButton.setTitle("My Cart", for: .normal)
        hamburgerButton.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 18)
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
        deliveryLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        deliveryLabel.textColor = .white
        
        // Address label
        addressLabel.text = "WORK - 903, 9th Floor, Primarc Tower"
        addressLabel.font = UIFont(name: "Montserrat-Bold", size: 14)
        addressLabel.textColor = UIColor.white.withAlphaComponent(0.9)
        addressLabel.numberOfLines = 1
    }
    
    private func setupSearchBar() {
        searchBar.backgroundColor = .white
        searchBar.layer.cornerRadius = 13
        searchBar.layer.masksToBounds = true
        
        // Search text field configuration
        searchTextField.textColor = .black
        searchTextField.font = UIFont(name: "Montserrat-Medium", size: 16)
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // Placeholder with proper attributes
        let placeholderText = "Let's search your needs"
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray,
                NSAttributedString.Key.font: UIFont(name: "Montserrat-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)
            ]
        )
        
        // Create left view container with proper frame
        let leftViewContainer = UIView()
        leftViewContainer.frame = CGRect(x: 0, y: 0, width: 45, height: 40)
        
        // Create search icon
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = UIColor.gray
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.frame = CGRect(x: 12, y: 10, width: 20, height: 20)
        
        leftViewContainer.addSubview(searchIcon)
        
        // Set left and right views
        searchTextField.leftView = leftViewContainer
        searchTextField.leftViewMode = .always
        
        // Add some right padding
        let rightViewContainer = UIView()
        rightViewContainer.frame = CGRect(x: 0, y: 0, width: 15, height: 40)
        searchTextField.rightView = rightViewContainer
        searchTextField.rightViewMode = .always
        
        // Constraint the text field to fill the search bar
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            searchTextField.topAnchor.constraint(equalTo: searchBar.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor)
        ])
    }
    
    private func setupConstraints() {
        // Set translatesAutoresizingMaskIntoConstraints to false for views using Auto Layout
        containerView.translatesAutoresizingMaskIntoConstraints = false
        hamburgerButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        bellButton.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Container view
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Hamburger button
            hamburgerButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            hamburgerButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 56),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 80),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 30),
            
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
            deliveryLabel.leadingAnchor.constraint(equalTo: hamburgerButton.leadingAnchor, constant: 8),
            deliveryLabel.topAnchor.constraint(equalTo: hamburgerButton.bottomAnchor, constant: 14),
            deliveryLabel.trailingAnchor.constraint(lessThanOrEqualTo: bellButton.leadingAnchor, constant: -8),
            
            // Location View
            locationView.leadingAnchor.constraint(equalTo: hamburgerButton.leadingAnchor, constant: 8),
            locationView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 5),
            locationView.widthAnchor.constraint(equalToConstant: 20),
            locationView.heightAnchor.constraint(equalToConstant: 20),
            
            // Address label
            addressLabel.leadingAnchor.constraint(equalTo: locationView.trailingAnchor, constant: 6),
            addressLabel.centerYAnchor.constraint(equalTo: locationView.centerYAnchor, constant: 0),
            addressLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -16),
            
            // Search bar
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            searchBar.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
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
        onHamburgerTapped?()
    }
    
    @objc private func cartTapped() {
        print("Cart tapped")
        onCartTapped?()
    }
    
    @objc private func bellTapped() {
        print("Bell notification tapped")
        onBellIconTapped?()
    }
    
    // MARK: - Public Methods
    func updateDeliveryText(_ text: String) {
        deliveryLabel.text = text
    }
    
    func updateAddressText(_ text: String) {
        addressLabel.text = text
    }
    
    func getSearchText() -> String {
        return searchTextField.text ?? ""
    }
    
    func clearSearch() {
        searchTextField.text = ""
    }
}
