//
//  TrendingProductCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class TrendingProductCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "TrendingProductCollectionViewCell"
    
    
    var cellData : TrendingProductModel? {
        didSet {
            guard let cellData = cellData else {return}
            productTitle.text = cellData.productTitle
            productPrice.text = "Rs." + cellData.productPrice + "/-"
            imgView.image = UIImage(named: cellData.productImg)
            
        }
    }
    
    
    public let cardView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 15
        vw.clipsToBounds = true
        return vw
    }()
    
    private let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    
    private let productTitle:UILabel = {
        let productTitle = UILabel()
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        //productTitle.font = UIFont(name: "Helvetica", size: 12)
        productTitle.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        return productTitle
    }()

    
    private let productPrice:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont(name: "Helvetica", size: 13)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
       // label.textColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        label.textColor = .priceLbl
        return label
    }()
    
    
    private let iconImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "cart.circle.fill")
        //img.tintColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        img.tintColor = .cartBtn
        //img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setUpView(){
        contentView.addSubview(cardView)
        cardView.addSubview(imgView)
        cardView.addSubview(productTitle)
        cardView.addSubview(productPrice)
        cardView.addSubview(iconImg)
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            imgView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            imgView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            imgView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            imgView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -50),
            
            
            productTitle.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            productTitle.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 5),
            
            
            productPrice.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 3),
            productPrice.leadingAnchor.constraint(equalTo: productTitle.leadingAnchor),
            
            iconImg.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5),
            iconImg.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -5),
            
            
        ])
        
    }
    
}











