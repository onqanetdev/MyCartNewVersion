//
//  AddressCell.swift
//  MyCartProject
//
//  Created by Onqanet on 14/08/25.
//

import UIKit

class AddressCell: UITableViewCell {
    
    static let identifier = "AddressCell"

    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white // Background for the individual address card
//        view.layer.cornerRadius = 10
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 4
//        view.layer.shadowOpacity = 0.1
        return view
    }()

    private let typeIconBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light gray background for icon
        view.layer.cornerRadius = 8 // Slightly rounded corners
        return view
    }()

    private let typeIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .detailView // Default icon color
        return imageView
    }()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 17)
        label.textColor = .black
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.textColor = .black
        label.numberOfLines = 1 // Ensure it fits on one line
        return label
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.font = UIFont(name: "Montserrat-Regular", size: 15)
        label.textColor = .black
        label.numberOfLines = 0 // Allow multiple lines for address
        return label
    }()

    private let phoneNumberIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "phone.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.textColor = .black
        return label
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = .clear // Make cell background clear to show table view background
        contentView.backgroundColor = .clear // Content view also clear
        selectionStyle = .none // No default selection highlight

        contentView.addSubview(containerView)
        containerView.addSubview(typeIconBackground)
        typeIconBackground.addSubview(typeIconImageView)
        containerView.addSubview(typeLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(phoneNumberIcon)
        containerView.addSubview(phoneNumberLabel)

        NSLayoutConstraint.activate([
            // Container View (the card-like background for each address)
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            // Type Icon Background
            
//            typeIconBackground.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            typeIconBackground.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            typeIconBackground.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            typeIconBackground.widthAnchor.constraint(equalToConstant: 35),
            typeIconBackground.heightAnchor.constraint(equalToConstant: 35),

            // Type Icon Image View
            typeIconImageView.centerXAnchor.constraint(equalTo: typeIconBackground.centerXAnchor),
            typeIconImageView.centerYAnchor.constraint(equalTo: typeIconBackground.centerYAnchor),
            typeIconImageView.widthAnchor.constraint(equalToConstant: 22),
            typeIconImageView.heightAnchor.constraint(equalToConstant: 22),

            // Type Label (Home/Work)
            typeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            typeLabel.leadingAnchor.constraint(equalTo: typeIconBackground.trailingAnchor, constant: 18),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -16),

            // Name Label
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            // Address Label
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            // Phone Number Icon
            phoneNumberIcon.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8),
            phoneNumberIcon.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor, constant: 0),
            phoneNumberIcon.widthAnchor.constraint(equalToConstant: 16),
            phoneNumberIcon.heightAnchor.constraint(equalToConstant: 16),
            phoneNumberIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16), // Pin to bottom of container

            // Phone Number Label
            phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberIcon.trailingAnchor, constant: 8),
            phoneNumberLabel.centerYAnchor.constraint(equalTo: phoneNumberIcon.centerYAnchor),
            phoneNumberLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    // MARK: - Configuration
    func configure(with address: AddressItem) {
        typeIconImageView.image = UIImage(systemName: address.typeIconName)
        typeLabel.text = address.type
        nameLabel.text = address.name
        addressLabel.text = address.fullAddress
        phoneNumberLabel.text = address.phoneNumber
    }
}
