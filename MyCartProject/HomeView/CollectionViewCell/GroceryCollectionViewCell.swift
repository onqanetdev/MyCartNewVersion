//
//  GroceryCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class GroceryCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "GroceryCollectionCell"
    
    
    var cellData : GroceryModel? {
        didSet {
            guard let cellData = cellData else {return}
            titleText.text = cellData.nameGrocery
            imgView.image = UIImage(named: cellData.img)
            
        }
    }
    
    private let groceryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .clear
        return view
    }()
    
    
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        imgView.backgroundColor = .clear
        return imgView
    }()
    
    
    private let titleText: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        //title.font = UIFont(name: "Helvetica", size: 12)
        title.font = UIFont(name: "Montserrat-SemiBold", size: 10)
        title.numberOfLines = 2
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        contentView.addSubview(groceryView)
        groceryView.addSubview(imgView)
        groceryView.addSubview(titleText)
        
        
        NSLayoutConstraint.activate([
            groceryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            groceryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            groceryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            groceryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imgView.topAnchor.constraint(equalTo: groceryView.topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: groceryView.leadingAnchor, constant: 0),
            imgView.trailingAnchor.constraint(equalTo: groceryView.trailingAnchor, constant: 0),
            imgView.bottomAnchor.constraint(equalTo: groceryView.bottomAnchor, constant: -25),
            
            //titleText.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 0),
            titleText.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            
            titleText.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 5),
            titleText.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -5),
            titleText.bottomAnchor.constraint(equalTo: groceryView.bottomAnchor, constant: -5)
            
        ])
    }
    
}
