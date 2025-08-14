//
//  ChangeAddressViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 14/08/25.
//

import UIKit

class ChangeAddressViewController: UIViewController,SelectAddressViewDelegate {
    
    
    
    let selectAddressView = SelectAddressView()
    
    let glassView = GlassyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .clear
        
        selectAddressView.translatesAutoresizingMaskIntoConstraints = false
        glassView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(glassView)
        glassView.addSubview(selectAddressView)
        
        selectAddressView.delegate = self
        
        setUpViewForSlcAdd()
    }
    

    func setUpViewForSlcAdd() {
        
        NSLayoutConstraint.activate([
            glassView.topAnchor.constraint(equalTo: view.topAnchor),
            glassView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            glassView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            glassView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            selectAddressView.topAnchor.constraint(equalTo: glassView.bottomAnchor, constant: -480),
            selectAddressView.leadingAnchor.constraint(equalTo: glassView.leadingAnchor, constant: 0),
            selectAddressView.trailingAnchor.constraint(equalTo: glassView.trailingAnchor, constant: 0),
            selectAddressView.bottomAnchor.constraint(equalTo: glassView.bottomAnchor, constant: 0)
        ])
        
        
            selectAddressView.layer.shadowColor = UIColor.black.cgColor
            selectAddressView.layer.shadowOpacity = 0.15
            selectAddressView.layer.shadowOffset = CGSize(width: 0, height: -3)
            selectAddressView.layer.shadowRadius = 8
            selectAddressView.layer.masksToBounds = false
        
    }
    
    
    func didTapDismissButton() {
        self.dismiss(animated: true)
    }
    
    func didTapAddNewAddress() {
        self.dismiss(animated: true)
    }
  
}



