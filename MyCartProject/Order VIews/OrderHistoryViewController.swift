//
//  OrderHistoryViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 30/07/25.
//

import UIKit

class OrderHistoryViewController: UIViewController {
    
    let stickyHeaderVw : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .systemBlue
        return nv
    }()
    
    
    let backgrounImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "header_background")
        img.contentMode = .scaleToFill
        return img
    }()
    
    
    //var examples = [73, 74, 75, 71, 69, 72, 76, 73]
    //var examples = [30,40,50,60]
    lazy var orderHistoryTblView:UITableView = {
        let tblView = UITableView()
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.separatorStyle = .none
        tblView.delegate = self
        tblView.dataSource = self
        tblView.backgroundColor = .white
        tblView.register(OrderHistoryTableViewCell.self, forCellReuseIdentifier: OrderHistoryTableViewCell.cellIdentifier)
        return tblView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
       
        configureUI()
        setUpNavigation()
        setUpHeaderView()
        
        
    }
    
    func configureUI(){
        view.addSubview(stickyHeaderVw)

        view.addSubview(orderHistoryTblView)
        stickyHeaderVw.addSubview(backgrounImg)
    }
    
    
    func setUpNavigation(){
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold) // Optional: custom font
        ]
        
        navigationItem.title = "Order History"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
    }
    
    func setUpHeaderView(){
        orderHistoryTblView.setUp(to: view)
        NSLayoutConstraint.activate([
            stickyHeaderVw.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stickyHeaderVw.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stickyHeaderVw.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding + 64)),
            stickyHeaderVw.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 64),
            
            backgrounImg.leadingAnchor.constraint(equalTo: stickyHeaderVw.leadingAnchor),
            backgrounImg.topAnchor.constraint(equalTo: stickyHeaderVw.topAnchor),
            backgrounImg.bottomAnchor.constraint(equalTo: stickyHeaderVw.bottomAnchor),
            backgrounImg.trailingAnchor.constraint(equalTo: stickyHeaderVw.trailingAnchor),
            

        ])
    }
    
    @objc func navigateBack(){
        navigationController?.popViewController(animated: true)
    }

    
   
    
}



extension OrderHistoryViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistoryProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderHistoryTableViewCell.cellIdentifier, for: indexPath) as? OrderHistoryTableViewCell else {fatalError("Unable deque cell...")}
        cell.selectionStyle = .none
        cell.cellData = orderHistoryProducts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

