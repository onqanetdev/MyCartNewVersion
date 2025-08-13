//
//  GlassyViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class GlassyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Transparent background to see underlying VC
       // view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.backgroundColor = .clear
        // Glass blur effect
        let blurEffect = UIBlurEffect(style: .systemThinMaterial) // .systemUltraThinMaterial for lighter
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 10, y: 200, width: view.bounds.width - 10, height: 600)
        blurView.autoresizingMask = [.flexibleWidth]
        blurView.layer.cornerRadius = 20
        blurView.clipsToBounds = true
        blurView.alpha = 0.9
        view.addSubview(blurView)
        
        // Dismiss button
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        closeButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        closeButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        closeButton.center = blurView.center
        
        view.addSubview(closeButton)
    }
    
    @objc func closePopup() {
        dismiss(animated: true)
    }
}
