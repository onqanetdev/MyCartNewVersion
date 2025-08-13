//
//  SnackesAndDrinksCell.swift
//  MyCartProject
//
//  Created by Onqanet on 11/08/25.
//

import UIKit

class SnackesAndDrinksCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "SnackesAndDrinksCell"
    
    
    var cellData : SnacksAndDrinksModel? {
        didSet {
            guard let cellData = cellData else {return}
            titleText.text = cellData.nameSnacks
            imgView.image = UIImage(named: cellData.img)
            
        }
    }
    
    private let snacksView: UIView = {
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
        contentView.addSubview(snacksView)
        snacksView.addSubview(imgView)
        snacksView.addSubview(titleText)
        
        
        NSLayoutConstraint.activate([
            snacksView.topAnchor.constraint(equalTo: contentView.topAnchor),
            snacksView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            snacksView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            snacksView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imgView.topAnchor.constraint(equalTo: snacksView.topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: snacksView.leadingAnchor, constant: 0),
            imgView.trailingAnchor.constraint(equalTo: snacksView.trailingAnchor, constant: 0),
            imgView.bottomAnchor.constraint(equalTo: snacksView.bottomAnchor, constant: -45),
            
//            titleText.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5),
            titleText.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            
            titleText.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 5),
            titleText.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -5),
            titleText.bottomAnchor.constraint(equalTo: snacksView.bottomAnchor, constant: -2)
            
        ])
    }
    
}
