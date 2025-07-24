//
//  TrendingProductsHeaderView.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class TrendingProductsHeaderView: UICollectionReusableView {
    
    
    static let headerIdentifier = "TrendingProductsHeaderView"
    
    
    var onViewAllTapped: (() -> Void)?
    
    private let headerTitle:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Trending Products"
        lbl.textColor = .black
        //lbl.font = UIFont(name: "Helvetica-bold", size: 14)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 16)
        return lbl
    }()
    
    
    private let viewAll:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View All", for: .normal)
       // btn.setTitleColor(UIColor(#colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)), for: .normal)
        btn.setTitleColor(.viewAllBtn, for: .normal)
       // btn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 14)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setUpHeaderView()
        //[allRestaurants,filterIcon,filterBtn,divider].forEach{addSubview($0)}
        viewAll.addTarget(self, action: #selector(showAllTrendingProducts), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpHeaderView(){
        addSubview(headerTitle)
        addSubview(viewAll)
        
        NSLayoutConstraint.activate([
            
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            
            viewAll.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            viewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    @objc func showAllTrendingProducts() {
        onViewAllTapped?() 
    }
}





