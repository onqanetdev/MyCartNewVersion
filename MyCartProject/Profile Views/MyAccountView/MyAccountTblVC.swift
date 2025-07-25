//
//  MyAccountTblVC.swift
//  MyCartProject
//
//  Created by Onqanet on 17/07/25.
//

import UIKit

class MyAccountTblVC: UITableViewCell {
    
    
    static let cellIdentifier = "MyAccountTblVC"
    
    
    var cellData : ProfileModel? {
        didSet {
            guard let cellData = cellData else {return}
            
            servicetypeText.text = cellData.serviceName
            itemImgView.image = UIImage(named: cellData.serviceImg)
            proccedImgView.image = UIImage(systemName: cellData.btnName)
            
        }
    }
    
    
    let mainView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        return view
    }()
    

    let servicetypeText:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Edit Profile"
        //lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Medium", size: 18)
        return lbl
    }()
    
    let itemImgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "square.and.pencil")
        imgView.backgroundColor = .clear
        imgView.tintColor = .black
        return imgView
    }()
    
    let proccedImgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .clear
        imgView.tintColor = .black
        imgView.image = UIImage(systemName: "chevron.forward")
        return imgView
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpCellView(){
        contentView.addSubview(mainView)
        mainView.addSubview(servicetypeText)
        mainView.addSubview(itemImgView)
        mainView.addSubview(proccedImgView)
        
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            itemImgView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            itemImgView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            itemImgView.widthAnchor.constraint(equalToConstant: 26),
            itemImgView.heightAnchor.constraint(equalToConstant: 26),
             
          
            servicetypeText.centerYAnchor.constraint(equalTo: itemImgView.centerYAnchor),
            servicetypeText.leadingAnchor.constraint(equalTo: itemImgView.trailingAnchor, constant: 15),
            
            
            proccedImgView.widthAnchor.constraint(equalToConstant: 18),
            proccedImgView.heightAnchor.constraint(equalToConstant: 22),
            proccedImgView.centerYAnchor.constraint(equalTo: itemImgView.centerYAnchor),
            proccedImgView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25)
        ])
    }
    
}






