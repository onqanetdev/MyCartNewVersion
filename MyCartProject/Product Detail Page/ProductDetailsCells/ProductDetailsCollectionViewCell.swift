//
//  ProductDetailsCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 09/07/25.
//

import UIKit





class ProductDetailsCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "ProductDetailsCollectionViewCell"
    
    
    var cellData : ProductDetailModel? {
        didSet {
            guard let cellData = cellData else {return}
            //bannerImage.image = UIImage(named: cellData.productImg)
            producttitle.text = cellData.productTitle
            amountlbl.text = cellData.productPrice
        }
    }
    
    
    let producttitle:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = UIFont(name: "Helvetica", size: 18)
        lbl.font = UIFont(name: "Montserrat-Medium", size: 16)
        lbl.textColor = .black
        return lbl
    }()
    
    let starStackView = UIStackView()
    let totalStars = 5
    let highlightedStars = 3
    
    
    let priceLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = UIFont(name: "Helvetica", size: 13)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        lbl.textColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        lbl.text = "Price:"
        return lbl
    }()
    
    let amountlbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = UIFont(name: "Helvetica", size: 14)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        lbl.textColor = .black
        lbl.text = "Rs. 10883/-"
        return lbl
    }()
    
    let quantityLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
       // lbl.font = UIFont(name: "Helvetica", size: 14)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        lbl.text = "QUANTITY:"
        lbl.textColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        return lbl
    }()
    
    
    let decrementBtn:UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "minus"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .white
        return btn
    }()
    
    let incrementBtn:UIButton = {
        let btn = UIButton()
         btn.translatesAutoresizingMaskIntoConstraints = false
         let boldConfig = UIImage.SymbolConfiguration(weight: .heavy)
         btn.setBackgroundImage(UIImage(systemName: "plus", withConfiguration: boldConfig), for: .normal)
         btn.tintColor = .white
         return btn
     }()
    
    let totalQantity:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = UIFont(name: "Helvetica", size: 30)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 30)
        lbl.text = "1"
        lbl.textColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        return lbl
    }()
    
    

    
    let cartBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false

        // Try to apply a bold symbol config (works only on symbol-compatible PDFs)
        let boldConfig = UIImage.SymbolConfiguration(weight: .heavy)
        let image = UIImage(named: "basket")?.withConfiguration(boldConfig).withRenderingMode(.alwaysTemplate)

        btn.setBackgroundImage(image, for: .normal)
        btn.tintColor = .white // Any color you want
        return btn
    }()


    
    
    
    let cartView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        view.layer.cornerRadius = 23
        return view
    }()
    
    
    let decrementView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    let incrementView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7340531349, green: 0.5922076106, blue: 0.9028964043, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraintsForViews()
        setupStarRatingView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setUpView(){
        cartView.addSubview(cartBtn)
        incrementView.addSubview(incrementBtn)
        decrementView.addSubview(decrementBtn)
        
        [producttitle, starStackView, priceLbl, amountlbl, quantityLbl, decrementView, incrementView, totalQantity, cartView].forEach { contentView.addSubview($0) }
    }
    
    func setUpConstraintsForViews(){
        
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            producttitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            producttitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            producttitle.widthAnchor.constraint(equalToConstant: 310),
            
            
            
            starStackView.leadingAnchor.constraint(equalTo: producttitle.leadingAnchor),
            starStackView.topAnchor.constraint(equalTo: producttitle.bottomAnchor, constant: 10),
            starStackView.heightAnchor.constraint(equalToConstant: 40),
            starStackView.widthAnchor.constraint(equalToConstant: 200),
            
            priceLbl.leadingAnchor.constraint(equalTo: producttitle.leadingAnchor),
            priceLbl.topAnchor.constraint(equalTo: starStackView.bottomAnchor,constant: 8),
            
            amountlbl.leadingAnchor.constraint(equalTo: priceLbl.trailingAnchor, constant: 10),
            amountlbl.topAnchor.constraint(equalTo: starStackView.bottomAnchor,constant: 8),
            
//            quantityLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 10),
            quantityLbl.leadingAnchor.constraint(equalTo: producttitle.leadingAnchor),
            
            quantityLbl.centerYAnchor.constraint(equalTo: decrementView.centerYAnchor),
            
            decrementView.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 10),
            decrementView.leadingAnchor.constraint(equalTo: quantityLbl.trailingAnchor, constant: 8),
            decrementView.widthAnchor.constraint(equalToConstant: 30),
            decrementView.heightAnchor.constraint(equalToConstant: 30),
            
            
            
            decrementBtn.centerYAnchor.constraint(equalTo: decrementView.centerYAnchor),
            decrementBtn.centerXAnchor.constraint(equalTo: decrementView.centerXAnchor),
            
            
            totalQantity.leadingAnchor.constraint(equalTo: decrementBtn.trailingAnchor, constant: 12),
            totalQantity.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 10),
            
            
            incrementView.leadingAnchor.constraint(equalTo: totalQantity.trailingAnchor, constant: 8),
            incrementView.topAnchor.constraint(equalTo: amountlbl.bottomAnchor, constant: 10),
            incrementView.widthAnchor.constraint(equalToConstant: 30),
            incrementView.heightAnchor.constraint(equalToConstant: 30),
            
            
            incrementBtn.centerYAnchor.constraint(equalTo: incrementView.centerYAnchor),
            incrementBtn.centerXAnchor.constraint(equalTo: incrementView.centerXAnchor),
            
            cartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cartView.topAnchor.constraint(equalTo: producttitle.bottomAnchor, constant: 15),
            cartView.widthAnchor.constraint(equalToConstant: 46),
            cartView.heightAnchor.constraint(equalToConstant: 46),
            
            cartBtn.centerYAnchor.constraint(equalTo: cartView.centerYAnchor),
            cartBtn.centerXAnchor.constraint(equalTo: cartView.centerXAnchor),
            cartBtn.widthAnchor.constraint(equalToConstant: 28),
            cartBtn.heightAnchor.constraint(equalToConstant: 36),
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






