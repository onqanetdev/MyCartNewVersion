//
//  CategorySideMenuCellWithoutImage.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class CategorySideMenuCellWithoutImage: UITableViewCell {
    
    static let cellIdentifier = "CategorySideMenuCellWithoutImage"
    
    let verticalSelection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 7 // Adjust as per design
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(verticalSelection)
        contentView.addSubview(menuLabel)
        
        NSLayoutConstraint.activate([
            verticalSelection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalSelection.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalSelection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalSelection.widthAnchor.constraint(equalToConstant: 5),
            
            menuLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            menuLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
}





