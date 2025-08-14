//
//  GlassyViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class GlassyViewController: UIViewController {
    
    
    let glassView = GlassyView()
    
    let label = UILabel()
    
    private let wholeImgView: UIImageView = {
        let vw = UIImageView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 10
        vw.clipsToBounds = true
        vw.contentMode = .scaleToFill
        vw.image = UIImage(named: "Sardar")
        return vw
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transparent background to see underlying VC
        //view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.backgroundColor = .detailView
        view.addSubview(wholeImgView)
        glassView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(glassView)
        
        
        label.text = "Liquid Glass"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        glassView.addVibrantSubview(label)
        
        setUpView()
    }
    
    
    
    func setUpView(){
        
        NSLayoutConstraint.activate([
            wholeImgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            wholeImgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            wholeImgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            wholeImgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            glassView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            glassView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            glassView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            glassView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: glassView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: glassView.centerYAnchor)
        ])
    }
}
