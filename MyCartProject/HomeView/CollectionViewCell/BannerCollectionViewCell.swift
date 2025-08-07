//
//  BannerCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "BannerCollectionViewCell"
    
    
    
    var cellData : AdBannnerModel? {
        didSet {
            guard let cellData = cellData else {return}
           // bannerBgImgView.image = UIImage(named: cellData.adImage)
        }
    }
    
  

    
    let bannerView = BannerView()
    
    
//    let bannerBgImgView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.translatesAutoresizingMaskIntoConstraints = false
//        imgView.layer.cornerRadius = 15
//        imgView.clipsToBounds = true
//        return imgView
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpBannerImg()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpBannerImg() {
        contentView.addSubview(bannerView)
        //bannerView.addSubview(bannerBgImgView)
        
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10),
            bannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            bannerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
//            bannerBgImgView.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 0),
//            bannerBgImgView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 0),
//            bannerBgImgView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: 0),
//            bannerBgImgView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 0),
            
            
            
        ])
        
    }
}







