//
//  BlurredViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class BlurredViewController: UIViewController {
    
    private var blurredEffectView: UIVisualEffectView!
    private let bottomSheetView = BottomSheetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        setupBlurEffect()
        setupBottomSheet()
        
        bottomSheetView.dismissButton.addTarget(self, action: #selector(dismissBlurredVC), for: .touchUpInside)
    }

    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = view.bounds
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurredEffectView.alpha = 0.8
        view.addSubview(blurredEffectView)
    }
    
    private func setupBottomSheet() {
        view.addSubview(bottomSheetView)
        
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
    }

    @objc private func dismissBlurredVC() {
        dismiss(animated: true)
    }
}







