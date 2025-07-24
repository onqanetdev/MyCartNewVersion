//
//  BasketGroupCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 11/07/25.
//

import UIKit

class BasketGroupCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "BasketGroupCollectionViewCell"
    
    var cellData : RestaurantListModel? {
        didSet {
            guard let cellData = cellData else {return}
            productImgView.image = UIImage(named: cellData.restaurantCoverImage)
            productTitle.text = cellData.restaurantName
            priceLbl.text = cellData.productPrice
        }
    }
    
    
    let cardView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    
    let productImgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let productTitle:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.font = UIFont(name: "Montserrat-Medium", size: 13)
        return lbl
    }()
    
    
    let starStackView = UIStackView()
    let totalStars = 5
    let highlightedStars = 3
    
    let priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rs. 1083 /-"
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        return lbl
    }()
    
    let crossBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(weight: .bold) // You can also try .heavy or .semibold
            let image = UIImage(systemName: "xmark", withConfiguration: config)
        
        btn.setBackgroundImage(image, for: .normal)
        btn.tintColor = .black
        return btn
    }()
    
    //Let increment decerement btn
    
    let minusBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        //btn.tintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        btn.tintColor = .decreaseBtn
        return btn
    }()
    
    let plusBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        //btn.tintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        btn.tintColor = .increaseBtn
        return btn
    }()
    
    let quatityLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1"
        lbl.font = UIFont.systemFont(ofSize: 20) // Set font size here
        
        //lbl.tintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        lbl.textColor = .quantityLbl
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        setupStarRatingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setupViews(){
        contentView.addSubview(cardView)
        cardView.addSubview(productImgView)
        cardView.addSubview(productTitle)
        cardView.addSubview(starStackView)
        cardView.addSubview(priceLbl)
        cardView.addSubview(crossBtn)
        
        //Quantity Label Setup
        
        cardView.addSubview(minusBtn)
        cardView.addSubview(quatityLabel)
        cardView.addSubview(plusBtn)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //cardView.heightAnchor.constraint(equalToConstant: 80),
            
            
            productImgView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            productImgView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            productImgView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            productImgView.widthAnchor.constraint(equalToConstant: 80),
            
            
            productTitle.leadingAnchor.constraint(equalTo: productImgView.trailingAnchor, constant: 10),
            productTitle.topAnchor.constraint(equalTo: productImgView.topAnchor, constant: 5),
            
            starStackView.leadingAnchor.constraint(equalTo: productTitle.leadingAnchor),
            starStackView.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 5),
            
            priceLbl.leadingAnchor.constraint(equalTo: productTitle.leadingAnchor),
            priceLbl.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 5),
            
            crossBtn.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 13),
            crossBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            crossBtn.widthAnchor.constraint(equalToConstant: 16),
            crossBtn.heightAnchor.constraint(equalToConstant: 20),
            
            
            plusBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            plusBtn.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),

            
            quatityLabel.trailingAnchor.constraint(equalTo: plusBtn.leadingAnchor, constant: -10),
            quatityLabel.bottomAnchor.constraint(equalTo: plusBtn.bottomAnchor, constant: 0),
            
            minusBtn.trailingAnchor.constraint(equalTo: quatityLabel.leadingAnchor, constant: -10),
            minusBtn.bottomAnchor.constraint(equalTo: plusBtn.bottomAnchor, constant: 0),
            
        ])
    }
    
    
    
    func setupStarRatingView() {
        // Configure StackView
        starStackView.axis = .horizontal
        starStackView.alignment = .center
        starStackView.distribution = .fillEqually
        starStackView.spacing = 8
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add Stars
        for i in 0..<totalStars {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.tintColor = (i < highlightedStars) ? .systemYellow : .lightGray
            starImageView.image = UIImage(systemName: "star.fill")
            starStackView.addArrangedSubview(starImageView)
        }
    }
    
}









