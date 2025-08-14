//
//  ProfileViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 16/07/25.
//

import UIKit






protocol ProfileViewControllerDelegate: AnyObject {
    func didSelectMenuItem()
}




class ProfileViewController: UIViewController {
    
    
    let profileHeadingView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 10
        //vw.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        vw.backgroundColor = .descriptionBtnColour
        return vw
    }()
    
    
    let profileImgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "person.circle.fill")
        imgView.tintColor = .white
        return imgView
    }()
    
    let userName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        lbl.text = "Test Name"
        return lbl
    }()

    let userEmailLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        lbl.text = "Test@gmail.com"
        return lbl
    }()
    
    
    weak var delegate: ProfileViewControllerDelegate?

    // Adding Table View
    
    
    lazy var sideMenuTableView:UITableView = {
        let tblVw = UITableView()
        tblVw.translatesAutoresizingMaskIntoConstraints = false
        tblVw.showsVerticalScrollIndicator = false
        tblVw.dataSource = self
        tblVw.delegate = self
        tblVw.register(SideMenuCell.self, forCellReuseIdentifier: SideMenuCell.cellIdentifier)
        return tblVw
    }()
    
    
    
    var contentsTitle = ["Home", "Product List", "Account Info", "My Cart", "Order List", "About Us", "Terms & Conditions", "Support", "Logout"]
    
    
    var respectiveImg = ["HomeDash","ProductList", "AccountInfo", "market",  "checklist", "About Us", "Terms", "Support", "Logout"]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingUpSideProfile()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
    }

    func settingUpSideProfile(){
        view.addSubview(profileHeadingView)
        profileHeadingView.addSubview(profileImgView)
        profileHeadingView.addSubview(userName)
        profileHeadingView.addSubview(userEmailLbl)
        
        
        view.addSubview(sideMenuTableView)
        
        
        NSLayoutConstraint.activate([
            profileHeadingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            profileHeadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeadingView.heightAnchor.constraint(equalToConstant: 165),
            
            //profile image view
            profileImgView.leadingAnchor.constraint(equalTo: profileHeadingView.leadingAnchor, constant: 16),
            profileImgView.topAnchor.constraint(equalTo: profileHeadingView.topAnchor, constant: 73),
            profileImgView.widthAnchor.constraint(equalToConstant: 60),
            profileImgView.heightAnchor.constraint(equalToConstant: 60),
            
            //Profile User Name and email setting
            
            userName.leadingAnchor.constraint(equalTo: profileImgView.trailingAnchor, constant: 10),
            userName.topAnchor.constraint(equalTo: profileImgView.topAnchor, constant: 0),
            
            userEmailLbl.leadingAnchor.constraint(equalTo: profileImgView.trailingAnchor, constant: 10),
            userEmailLbl.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10),
            
            
            sideMenuTableView.topAnchor.constraint(equalTo: profileHeadingView.bottomAnchor, constant: 0),
            sideMenuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            sideMenuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            sideMenuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}








extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.cellIdentifier, for: indexPath) as? SideMenuCell else {fatalError("Unable deque cell...")}
            //cell.cellData = restaurantListMockData[indexPath.row]
        cell.titleLbl.text = contentsTitle[indexPath.row]
        
        cell.imgViewTitle.image = UIImage(named: respectiveImg[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        
        cell.imgViewTitle.tintColor = .descriptionBtnColour
         return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.didSelectMenuItem()
        
        
        if contentsTitle[indexPath.row] == "Account Info" {
            navigationController?.pushViewController(MyAccountViewController(), animated: true)
        } else if contentsTitle[indexPath.row] == "About Us" {
            navigationController?.pushViewController(AboutUsViewController(), animated: true)
            
        } else if contentsTitle[indexPath.row] == "Terms & Conditions" {
            
            navigationController?.pushViewController(TermsCondiViewController(), animated: true)
        } else if contentsTitle[indexPath.row] == "Support" {
            //navigationController?.pushViewController(Su, animated: <#T##Bool#>)
        } else if contentsTitle[indexPath.row] == "Catalogue" {
           
            
        } else if contentsTitle[indexPath.row] == "Contact List" {
           
            //navigationController.
            
        } else if contentsTitle[indexPath.row] == "Birthday Wishes List" {
            
            
        }else if contentsTitle[indexPath.row] == "Order List" {
           navigationController?.pushViewController(OrderHistoryViewController(), animated: true)
            
            
//            let successVC = OrderSuccessViewController()
//            successVC.modalPresentationStyle = .fullScreen
//            present(successVC, animated: true)
            
        } else if contentsTitle[indexPath.row] == "Logout" {
            
            
        }
    }
}









