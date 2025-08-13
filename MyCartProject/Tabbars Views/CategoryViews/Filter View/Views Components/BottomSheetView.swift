//
//  BottomSheetView.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class BottomSheetView: UIView {
    
    // MARK: - UI Elements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filters"
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        if let xmarkImage = UIImage(systemName: "xmark.circle.fill") {
            button.setImage(xmarkImage, for: .normal)
        } else {
            button.setTitle("X", for: .normal)
        }
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let sideMenuView = CustomSideFilterView() // Assuming this is defined elsewhere
    
    // MARK: - New UI Elements for Buttons
    let clearFiltersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear filters", for: .normal)
        button.setTitleColor(.darkGray, for: .normal) // Set appropriate color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = .systemGray5//UIColor(white: 0.95, alpha: 1.0) // Light gray background
        button.layer.cornerRadius = 10 // Rounded corners
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apply", for: .normal)
        button.setTitleColor(.white, for: .normal) // White text color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = .systemGray2//UIColor(red: 0.2, green: 0.7, blue: 0.3, alpha: 1.0) // Example green color
        button.layer.cornerRadius = 10 // Rounded corners
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [clearFiltersButton, applyButton])
        stackView.axis = .horizontal // Arrange horizontally
        stackView.distribution = .fillEqually // Make buttons equal width
        stackView.spacing = 15 // Space between buttons
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    var filterView = FilterView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -5)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.4
        
        addSubview(titleLabel)
        addSubview(dismissButton)
        addSubview(sideMenuView)
        addSubview(buttonStackView) // Add the new stack view
        addSubview(filterView)
        
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        let sideMenuWidth = UIScreen.main.bounds.width * 0.30
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            dismissButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            sideMenuView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideMenuView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sideMenuView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10),
            sideMenuView.widthAnchor.constraint(equalToConstant: sideMenuWidth),
            
            
            
            filterView.topAnchor.constraint(equalTo: sideMenuView.topAnchor),
            filterView.leadingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: 3),
            filterView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            filterView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor, constant: 0),
            
            // MARK: - Constraints for the new Button Stack View
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Leading padding
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Trailing padding
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
        ])
    }
}
