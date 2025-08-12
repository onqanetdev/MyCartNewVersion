//
//  CategorySideMenuCell.swift
//  MyCartProject
//
//  Created by Onqanet on 08/08/25.
//

import UIKit

class CategorySideMenuCell: UITableViewCell {
    
    
    static let cellIdentifier = "CategorySideMenuCell"
    
    // MARK: - UI Elements
    private let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 25 // Half of width/height for perfect circle
        view.clipsToBounds = true
        return view
    }()
    
    let menuImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    
    public let verticalSelection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .detailView
        view.layer.cornerRadius = 7 // Adjust as per design
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(view1)
        view1.addSubview(view2)
        view2.addSubview(menuImageView)
        view1.addSubview(menuLabel)
        view1.addSubview(verticalSelection)
        
        NSLayoutConstraint.activate([
            // view1 fills the whole cell
            view1.topAnchor.constraint(equalTo: contentView.topAnchor),
            view1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // view2 (circle) in center top
            view2.topAnchor.constraint(equalTo: view1.topAnchor, constant: 5),
            view2.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            view2.widthAnchor.constraint(equalToConstant: 50),
            view2.heightAnchor.constraint(equalToConstant: 50),
            
            // image inside view2
            menuImageView.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 5),
            menuImageView.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -5),
            menuImageView.topAnchor.constraint(equalTo: view2.topAnchor, constant: 5),
            menuImageView.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 15),
            
            // label below view2
            menuLabel.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 4),
            menuLabel.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 2),
            menuLabel.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -2),
            menuLabel.bottomAnchor.constraint(lessThanOrEqualTo: view1.bottomAnchor, constant: -4),
            
            
            verticalSelection.widthAnchor.constraint(equalToConstant: 4),
            verticalSelection.topAnchor.constraint(equalTo: view1.topAnchor),
            verticalSelection.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            verticalSelection.trailingAnchor.constraint(equalTo: view1.trailingAnchor),
            verticalSelection.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            
        ])
    }
}









