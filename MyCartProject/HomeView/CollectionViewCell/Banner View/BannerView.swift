//
//  BannerView.swift
//  MyCartProject
//
//  Created by Onqanet on 06/08/25.
//

import UIKit


class BannerView: UIView {

    let percentageLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "15%"
        lbl.textColor = .white
        lbl.font = UIFont(name: "Montserrat-Bold", size: 27)
        return lbl
    }()

    let discountLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Discount on"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Bold", size: 18)
        return lbl
    }()

    let productDiscountLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "All Bottom Wear Products"
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Montserrat-Bold", size: 18)
        return lbl
    }()

    let productImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "VegetablesTwo")
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()

    let bannerBgImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "MyCart_SubHeaderView")
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 25
        imgView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return imgView
    }()

    // Stack Views
    lazy var stackView1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [percentageLbl, discountLbl])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()

    lazy var stackView2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stackView1, productDiscountLbl])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = -3
        stack.alignment = .leading
        return stack
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBannerView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBannerView()
    }

    func setupBannerView() {
        addSubview(bannerBgImgView)
        addSubview(stackView2)
        addSubview(productImg)

        NSLayoutConstraint.activate([
            // Background Image
            bannerBgImgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerBgImgView.topAnchor.constraint(equalTo: topAnchor),
            bannerBgImgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerBgImgView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // stackView2
            stackView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stackView2.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            stackView2.widthAnchor.constraint(lessThanOrEqualToConstant: 180),

            // stackView1 height same as percentageLbl
            stackView1.heightAnchor.constraint(equalTo: percentageLbl.heightAnchor),

            // Product Image
            productImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            productImg.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            productImg.widthAnchor.constraint(equalToConstant: 210),
            productImg.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
}



