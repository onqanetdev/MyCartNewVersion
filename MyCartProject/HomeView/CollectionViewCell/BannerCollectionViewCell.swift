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
            bannerImgView.image = UIImage(named: cellData.adImage)
        }
    }
    
    
    let bannerImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 15
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpBannerImg()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpBannerImg() {
        contentView.addSubview(bannerImgView)
        
        NSLayoutConstraint.activate([
            bannerImgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            bannerImgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            bannerImgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
