//
//  FilterOptionCell.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class FilterOptionCell: UITableViewCell {
    
    static let reuseIdentifier = "FilterOptionCell"

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // Ensure image fills the space
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8 // Slightly rounded corners for the image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont.systemFont(ofSize: 14)
        label.font = UIFont(name: "Montserrat-Bold", size: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var checkboxButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .detailView // Customize checkbox color
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        return button
    }()

    var onCheckboxTapped: ((Bool) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(checkboxButton)

        // Constraints for iconImageView
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Constraints for nameLabel
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -8) // Slightly above center
        ])

        // Constraints for countLabel
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            countLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])

        // Constraints for checkboxButton
        NSLayoutConstraint.activate([
            checkboxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            checkboxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 24),
            checkboxButton.heightAnchor.constraint(equalToConstant: 24)
        ])

        // Add a constraint to ensure labels don't overlap the checkbox
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkboxButton.leadingAnchor, constant: -8).isActive = true
        countLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkboxButton.leadingAnchor, constant: -8).isActive = true
    }

    func configure(with option: FilterOptionModel) {
        iconImageView.image = UIImage(named: option.imageName) // Use UIImage(named:) for images in Assets.xcassets
        nameLabel.text = option.name
        countLabel.text = "(\(option.count))"
        checkboxButton.isSelected = option.isSelected
    }

    @objc private func checkboxTapped() {
        checkboxButton.isSelected.toggle()
        onCheckboxTapped?(checkboxButton.isSelected)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = nil
        countLabel.text = nil
        checkboxButton.isSelected = false
    }
}
