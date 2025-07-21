//
//  SideMenuCell.swift
//  MyCartProject
//
//  Created by Onqanet on 16/07/25.
//

import UIKit

class SideMenuCell: UITableViewCell {
    

    static let cellIdentifier = "SideMenuCell"
    
    
    let mainView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .white
        return vw
    }()
    
    
    
    let imgViewTitle:UIImageView = {
        let imgVW = UIImageView()
        imgVW.translatesAutoresizingMaskIntoConstraints = false
        imgVW.tintColor = .white
        return imgVW
    }()
    
    
    let titleLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "My Contact"
        lbl.textColor = .darkGray
        return lbl
    }()
    
//    let moreBtn:UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
//        return btn
//    }()

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    func setUpCellView(){
        contentView.addSubview(mainView)
        mainView.addSubview(imgViewTitle)
        mainView.addSubview(titleLbl)
        //mainView.addSubview(moreBtn)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            imgViewTitle.widthAnchor.constraint(equalToConstant: 21),
            imgViewTitle.heightAnchor.constraint(equalToConstant: 21),
            imgViewTitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            imgViewTitle.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            
            titleLbl.leadingAnchor.constraint(equalTo: imgViewTitle.trailingAnchor, constant: 40),
            titleLbl.centerYAnchor.constraint(equalTo: imgViewTitle.centerYAnchor),
            
//            moreBtn.widthAnchor.constraint(equalToConstant: 9),
//            moreBtn.heightAnchor.constraint(equalToConstant: 14),
//            moreBtn.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27),
//            moreBtn.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor)
            
        ])
    }
    
    
    
}







