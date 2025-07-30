//
//  NotificationTableViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 30/07/25.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "NotificationTableViewCell"
    
    
    
    var cellData : NotificationModel? {
        didSet {
            guard let cellData = cellData else {return}
            
            orderPlacedLbl.text = cellData.orderType
            orderDetails.text = cellData.orderTypeDetails
           
            
        }
    }
    
    
    private let posterView: UIView = {
        let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.backgroundColor = .white
        uv.layer.cornerRadius = 20
        uv.layer.borderWidth = 1
        uv.layer.borderColor = UIColor.gray.cgColor
        return uv
    }()
    
    private var orderPlacedLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Order Confirmed"
        lbl.textColor = UIColor.descriptionBtnColour
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        return lbl
    }()
    
    private var orderDetails:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Your order #12345 has been confirmed and is being prepared"
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Montserrat-Medium", size: 14)
        return lbl
    }()

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUpCellView(){
        addSubview(posterView)
        posterView.addSubview(orderPlacedLbl)
        posterView.addSubview(orderDetails)
        
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            posterView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            posterView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            posterView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            orderPlacedLbl.topAnchor.constraint(equalTo: posterView.topAnchor, constant: 12),
            orderPlacedLbl.leadingAnchor.constraint(equalTo: posterView.leadingAnchor, constant: 15),
            orderPlacedLbl.trailingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: -5),
            
            orderDetails.topAnchor.constraint(equalTo: orderPlacedLbl.bottomAnchor, constant: 0),
            orderDetails.leadingAnchor.constraint(equalTo: orderPlacedLbl.leadingAnchor, constant: 0),
            orderDetails.trailingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: -15),
            orderDetails.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}
