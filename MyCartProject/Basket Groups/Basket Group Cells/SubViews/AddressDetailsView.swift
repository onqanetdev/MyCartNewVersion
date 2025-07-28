//
//  AddressDetailsView.swift
//  MyCartProject
//
//  Created by Onqanet on 25/07/25.
//

import UIKit




class AddressDetailsView: UIView {

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear // Optional: set background
        view.layer.cornerRadius = 10  // Optional: for rounded corners
        view.clipsToBounds = true
        return view
    }()

    private var homeIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "house")
        imgView.tintColor = .descriptionBtnColour // make sure this is defined in your Assets or extension
        return imgView
    }()

    private var userName: UILabel = {
        let userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Jonny Smith"
        userName.font = UIFont(name: "Montserrat-SemiBold", size: 14)
        userName.textColor = .black
        return userName
    }()

    private var addressLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.text = "Primarc Tower, #903 - 9th Floor, DN - 36 Block, Sector- V, Salt Lake, Kolkata, West Bengal 700091"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Medium", size: 13)
        return lbl
    }()

    private var phoneIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "phone.fill")
        img.tintColor = .black
        return img
    }()

    private var phoneNumberField: UILabel = {
        let nF = UILabel()
        nF.translatesAutoresizingMaskIntoConstraints = false
        nF.textColor = .black
        nF.text = "8274005101"
        nF.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        return nF
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAddressView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpAddressView()
    }

    // MARK: - Setup Method

    func setUpAddressView() {
        addSubview(containerView)

        containerView.addSubview(homeIcon)
        containerView.addSubview(userName)
        containerView.addSubview(addressLbl)
        containerView.addSubview(phoneIcon)
        containerView.addSubview(phoneNumberField)

        NSLayoutConstraint.activate([
            // Container view pinned to all edges
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            homeIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            homeIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            homeIcon.widthAnchor.constraint(equalToConstant: 22),
            homeIcon.heightAnchor.constraint(equalToConstant: 18),

            userName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            userName.leadingAnchor.constraint(equalTo: homeIcon.trailingAnchor, constant: 10),
            userName.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -10),

            addressLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            addressLbl.topAnchor.constraint(equalTo: homeIcon.bottomAnchor, constant: 6),
            addressLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            addressLbl.heightAnchor.constraint(equalToConstant: 50),

            phoneIcon.widthAnchor.constraint(equalToConstant: 25),
            phoneIcon.heightAnchor.constraint(equalToConstant: 25),
            phoneIcon.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 10),
            phoneIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),

            phoneNumberField.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 10),
            phoneNumberField.centerYAnchor.constraint(equalTo: phoneIcon.centerYAnchor),
            phoneNumberField.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -10)
        ])
    }
}

