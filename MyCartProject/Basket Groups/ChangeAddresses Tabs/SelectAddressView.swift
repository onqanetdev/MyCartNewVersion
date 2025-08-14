//
//  SelectAddressView.swift
//  MyCartProject
//
//  Created by Onqanet on 14/08/25.
//

import UIKit



protocol SelectAddressViewDelegate: AnyObject {
    func didTapDismissButton()
    func didTapAddNewAddress()
   // func didSelectAddress(_ address: AddressItem)
}

extension SelectAddressViewDelegate {
    func didSelectAddress(_ address: AddressItem) {}
}


class SelectAddressView: UIView {
    
    static let addressCellIdentifier = "AddressCell"

    weak var delegate: SelectAddressViewDelegate?

    
    

    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SELECT ADDRESS"
        //label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        label.textColor = .black
        return label
    }()

    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .black // Changed to gray as per image
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()

    private let addNewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold) // Smaller plus icon
        let plusImage = UIImage(systemName: "plus", withConfiguration: config)
        button.setImage(plusImage, for: .normal)
        button.setTitle(" Add New", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        //button.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light gray background
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.tintColor = .white // Ensure plus icon is black
        button.semanticContentAttribute = .forceLeftToRight // Icon on left
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10) // Padding inside button
        button.addTarget(self, action: #selector(addNewButtonTapped), for: .touchUpInside)
        return button
    }()

    private let addressesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // No default separators between cells
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear // Transparent background
        tableView.estimatedRowHeight = 150 // Estimate height for self-sizing cells
        tableView.rowHeight = UITableView.automaticDimension // Enable self-sizing
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0) // Padding at bottom
        return tableView
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = UIColor(white: 0.98, alpha: 1.0) // Light off-white background as per image
        layer.cornerRadius = 15 // Rounded corners for the entire view
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
        clipsToBounds = true // Clip content to rounded corners

        addSubview(titleLabel)
        addSubview(dismissButton)
        addSubview(addNewButton)
        addSubview(addressesTableView)

        setupTableView()

        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            //titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            // Dismiss Button
            dismissButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),

            // Add New Button
            addNewButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            addNewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addNewButton.heightAnchor.constraint(equalToConstant: 35), // Fixed height for button

            // Addresses Table View
            addressesTableView.topAnchor.constraint(equalTo: addNewButton.bottomAnchor, constant: 15),
            addressesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            addressesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            addressesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupTableView() {
        addressesTableView.dataSource = self
        addressesTableView.delegate = self
        addressesTableView.register(AddressCell.self, forCellReuseIdentifier: AddressCell.identifier)
    }

    // MARK: - Actions
    @objc private func dismissButtonTapped() {
        delegate?.didTapDismissButton()
    }

    @objc private func addNewButtonTapped() {
        delegate?.didTapAddNewAddress()
    }
}




// MARK: - UITableViewDataSource
extension SelectAddressView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.identifier, for: indexPath) as? AddressCell else {
            return UITableViewCell()
        }
        let address = addresses[indexPath.row]
        cell.configure(with: address)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectAddressView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedAddress = addresses[indexPath.row]
        //delegate?.didSelectAddress(selectedAddress)
    }

    // This method is important for self-sizing cells in a UITableView that uses Auto Layout
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 // Provide a reasonable estimate
    }
}

