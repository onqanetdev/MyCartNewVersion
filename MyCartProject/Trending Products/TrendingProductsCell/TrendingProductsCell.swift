//
//  TrendingProductsCell.swift
//  MyCartProject
//
//  Created by Onqanet on 08/07/25.
//

import UIKit

class TrendingProductsCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "TrendingProductsCell"
    
    
    var cellData : AllTrendingProducts? {
        didSet {
            guard let cellData = cellData else {return}
            productTitle.text = cellData.productTitle
            productPrice.text = "Rs." + cellData.productPrice + "/-"
            imgView.image = UIImage(named: cellData.productImg)
            productQuantity.text = cellData.quantity
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
        productTitle.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        return productTitle
    }()

    
    private let productPrice:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont(name: "Helvetica", size: 13)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.textColor = .priceLbl
        return label
    }()
    
    
    private let oldPrice:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont(name: "Helvetica", size: 13)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.textColor = .systemGray
        label.setStrikethrough(text: label.text ?? "Rs. 999/-")
        return label
    }()

    
    private let iconImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "cart.circle.fill")
        img.tintColor = .cartBtn
        //img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    
    //Offers View
    private let offerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cartBtn
        return view
    }()
    
    
    private let offersLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "%15 off"
        //lbl.font = UIFont(name: "Helvetica-bold", size: 12)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        lbl.textColor = .white
        return lbl
    }()
    
    
    //Quantity View
    
    private let quantityVw:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
       // vw.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        vw.backgroundColor = .hundredMgLblColour
        vw.layer.cornerRadius = 7
        return vw
    }()
    
    
    private let sqaureView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 5
        return vw
    }()
    
    
    private let dotLbl: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .priceLbl
        vw.layer.cornerRadius = 3
        return vw
    }()
    
    private let productQuantity:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont(name: "Helvetica", size: 13)
        label.font = UIFont(name: "Montserrat-Medium", size: 13)
        label.textColor = .white
        label.text = "400 gm"
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpOffersLbl()
        setUpQuantityView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setUpView(){
        contentView.addSubview(cardView)
        cardView.addSubview(imgView)
        
        //cardView.addSubview(productQuantity)
        cardView.addSubview(productTitle)
        cardView.addSubview(productPrice)
        cardView.addSubview(iconImg)
        
        cardView.addSubview(oldPrice)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            imgView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            imgView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            imgView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -90),
                        
            
            //productTitle.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            productTitle.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            productTitle.bottomAnchor.constraint(equalTo: productPrice.topAnchor, constant: -3),
            
            //productPrice.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 3),
            productPrice.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            productPrice.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            
            oldPrice.leadingAnchor.constraint(equalTo: productPrice.trailingAnchor, constant: 12),
            oldPrice.bottomAnchor.constraint(equalTo: productPrice.bottomAnchor),
            
            //iconImg.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 5),
            iconImg.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -5),
            iconImg.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            
        ])
        
    }
    
    private func setUpOffersLbl(){
        imgView.addSubview(offerView)
        offerView.addSubview(offersLbl)
        
        NSLayoutConstraint.activate([
            offerView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -5),
            offerView.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -15),
            offerView.widthAnchor.constraint(equalToConstant: 50),
            offerView.heightAnchor.constraint(equalToConstant: 20),
        
            offersLbl.centerXAnchor.constraint(equalTo: offerView.centerXAnchor),
            offersLbl.centerYAnchor.constraint(equalTo: offerView.centerYAnchor)
        ])
    }
    
    private func setUpQuantityView(){
        cardView.addSubview(quantityVw)
        quantityVw.addSubview(sqaureView)
        sqaureView.addSubview(dotLbl)
        
        quantityVw.addSubview(productQuantity)
        
        
        
        NSLayoutConstraint.activate([
            quantityVw.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            quantityVw.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            quantityVw.widthAnchor.constraint(equalToConstant: 90),
            quantityVw.heightAnchor.constraint(equalToConstant: 30),
            
            sqaureView.leadingAnchor.constraint(equalTo: quantityVw.leadingAnchor, constant: 5),
            sqaureView.centerYAnchor.constraint(equalTo: quantityVw.centerYAnchor),
            sqaureView.widthAnchor.constraint(equalToConstant: 20),
            sqaureView.heightAnchor.constraint(equalToConstant: 20),
            
            dotLbl.centerXAnchor.constraint(equalTo: sqaureView.centerXAnchor),
            dotLbl.centerYAnchor.constraint(equalTo: sqaureView.centerYAnchor),
            dotLbl.widthAnchor.constraint(equalToConstant: 6),
            dotLbl.heightAnchor.constraint(equalToConstant: 6),
            
            productQuantity.trailingAnchor.constraint(equalTo: quantityVw.trailingAnchor, constant: -15),
            productQuantity.centerYAnchor.constraint(equalTo: quantityVw.centerYAnchor),
        ])
    }
}






