//
//  MyAccountViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 16/07/25.
//

import UIKit

class MyAccountViewController: UIViewController {
    
    
    let topBackgroundImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 0
        img.clipsToBounds = true
        img.image = UIImage(named: "top_background")
        img.contentMode = .scaleToFill
        return img
    }()
    
    
    
    let personImgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        //imgView.layer.cornerRadius = 35
        imgView.image = UIImage(named: "user")
        return imgView
    }()
    
    let personView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        view.layer.cornerRadius = 60
        view.layer.borderWidth = 4
        //view.layer.borderColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        view.layer.borderColor = UIColor(.profileImgBorder).cgColor
        return view
    }()

    lazy var tblView:UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(MyAccountTblVC.self, forCellReuseIdentifier: MyAccountTblVC.cellIdentifier)
        tblView.isScrollEnabled = false
        tblView.separatorColor = .cellBorder
        tblView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return tblView
    }()
    
    let userNameLbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "USER NAME"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        lbl.textColor = .black
        return lbl
    }()
    
    let borderView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        vw.layer.cornerRadius = 2
        return vw
    }()
    
    
    let logoutBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
       
        btn.backgroundColor = .logoutBtn
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(tappedLogout), for: .touchUpInside)
        return btn
    }()
    
    let btnView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        //vw.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        vw.clipsToBounds = true
        vw.layer.cornerRadius = 15
        vw.isUserInteractionEnabled = false
        return vw
    }()
    
    let logoutLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Logout"
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.isUserInteractionEnabled = false
        lbl.textColor = .white
        return lbl
    }()
    
    let logoutImg:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        if let image = UIImage(named: "logoutImg")?.withRenderingMode(.alwaysTemplate) {
            imgView.image = image
        }
        
        imgView.tintColor = .white
        imgView.isUserInteractionEnabled = false
        return imgView
    }()
    
    
    let backBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        
        settingUpTopView()
        
        settingUpTblView()
        
        

        
    }
    
    
    func settingUpTopView(){
        view.addSubview(topBackgroundImg)
        //view.addSubview(personImgView)
        
        view.addSubview(backBtn)
        
        view.addSubview(personView)
        personView.addSubview(personImgView)
        
        view.addSubview(userNameLbl)
        view.addSubview(borderView)
        
        view.addSubview(logoutBtn)
        
        logoutBtn.addSubview(btnView)
        
        btnView.addSubview(logoutLbl)
        btnView.addSubview(logoutImg)
        
        NSLayoutConstraint.activate([
            
            topBackgroundImg.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            topBackgroundImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topBackgroundImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topBackgroundImg.heightAnchor.constraint(equalToConstant: 270),
            
            
            personView.heightAnchor.constraint(equalToConstant: 120),
            personView.widthAnchor.constraint(equalToConstant: 120),
            personView.centerXAnchor.constraint(equalTo: topBackgroundImg.centerXAnchor),
            personView.bottomAnchor.constraint(equalTo: topBackgroundImg.bottomAnchor, constant:  45),
            
            
            personImgView.widthAnchor.constraint(equalToConstant: 70),
            personImgView.heightAnchor.constraint(equalToConstant: 70),
            personImgView.centerXAnchor.constraint(equalTo: personView.centerXAnchor),
            personImgView.centerYAnchor.constraint(equalTo: personView.centerYAnchor),
            
            userNameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLbl.topAnchor.constraint(equalTo: personView.bottomAnchor, constant: 12),
            
            borderView.heightAnchor.constraint(equalToConstant: 4),
            borderView.widthAnchor.constraint(equalToConstant: 28),
            borderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borderView.topAnchor.constraint(equalTo: userNameLbl.bottomAnchor, constant: 4),
            
            logoutBtn.heightAnchor.constraint(equalToConstant: 60),
            logoutBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            logoutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            logoutBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            btnView.leadingAnchor.constraint(equalTo: logoutBtn.leadingAnchor),
            btnView.trailingAnchor.constraint(equalTo: logoutBtn.trailingAnchor),
            btnView.topAnchor.constraint(equalTo: logoutBtn.topAnchor),
            btnView.bottomAnchor.constraint(equalTo: logoutBtn.bottomAnchor),
            
            
            logoutLbl.centerXAnchor.constraint(equalTo: btnView.centerXAnchor),
            logoutLbl.centerYAnchor.constraint(equalTo: btnView.centerYAnchor),
            
            logoutImg.trailingAnchor.constraint(equalTo: logoutLbl.leadingAnchor, constant: -5),
            logoutImg.centerYAnchor.constraint(equalTo: btnView.centerYAnchor),
            logoutImg.widthAnchor.constraint(equalToConstant: 35),
            logoutImg.heightAnchor.constraint(equalToConstant: 35),
            
            
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backBtn.heightAnchor.constraint(equalToConstant: 25),
            backBtn.widthAnchor.constraint(equalToConstant: 20),
            
            
            
        ])
    }
    
    
    func settingUpTblView(){
        view.addSubview(tblView)

        NSLayoutConstraint.activate([
            tblView.topAnchor.constraint(equalTo: personView.bottomAnchor, constant: 40),
            tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tblView.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    
    @objc func tappedLogout(){
        print("Logout tapped")
    }
    
    @objc func backToPrevious(){
        navigationController?.popViewController(animated: true)
    }
}





