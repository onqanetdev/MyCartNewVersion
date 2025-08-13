//
//  BlurredViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class BlurredViewController: UIViewController {
    

    private var blurredEffectView: UIVisualEffectView!

    private var sideMenuView: CustomSideFilterView!
    
    // MARK: - New UIView properties
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8 // Slightly rounded corners for better aesthetics
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Only top corners
        return view
    }()

    private let bottomSheetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filters" // Example title based on the provided image
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        // Use an SF Symbol for the 'xmark' icon
        if let xmarkImage = UIImage(systemName: "xmark.circle.fill") {
            button.setImage(xmarkImage, for: .normal)
        } else {
            button.setTitle("X", for: .normal) // Fallback title
        }
        button.tintColor = .black // Or any desired color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .clear
        setupBlurEffect()
    
        setupBottomSheetView()
        
        dismissButton.addTarget(self, action: #selector(dismissBlurredVC), for: .touchUpInside)
    }

    // MARK: - Setup UI Elements

    private func setupBlurEffect() {
       
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)

        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurredEffectView.frame = view.bounds // Initially set frame

        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        blurredEffectView.alpha = 0.8 // Adjust this value (0.0 to 1.0) for desired opacity

        view.addSubview(blurredEffectView)
    }

    

    private func setupBottomSheetView() {
        view.addSubview(bottomSheetView)

        
       
        NSLayoutConstraint.activate([
            bottomSheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomSheetView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            //bottomSheetView.heightAnchor.constraint(equalToConstant: bottomSheetHeight)
            
        ])

        // Add a top shadow
        bottomSheetView.layer.shadowColor = UIColor.black.cgColor
        bottomSheetView.layer.shadowOffset = CGSize(width: 0, height: -5) // Shadow above the view
        bottomSheetView.layer.shadowRadius = 8 // Soften the shadow
        bottomSheetView.layer.shadowOpacity = 0.4 // Make it subtle

        // Add the title label to the new UIView
        bottomSheetView.addSubview(bottomSheetTitleLabel)
        
        sideMenuView = CustomSideFilterView()
        bottomSheetView.addSubview(sideMenuView)
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false
        
        let screenWidth = view.bounds.width
        let sideMenuWidth = screenWidth * 0.30
        
        
        
        NSLayoutConstraint.activate([
            bottomSheetTitleLabel.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 20),
            bottomSheetTitleLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 20),
            
            sideMenuView.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 0), // Fixed to the left edge
            sideMenuView.topAnchor.constraint(equalTo: bottomSheetTitleLabel.bottomAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: bottomSheetView.bottomAnchor, constant: -50),
            sideMenuView.widthAnchor.constraint(equalToConstant: sideMenuWidth)
        ])

        // Add the xmark button to the new UIView
        bottomSheetView.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 15),
            dismissButton.trailingAnchor.constraint(equalTo: bottomSheetView.trailingAnchor, constant: -20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    // MARK: - Actions
    @objc private func dismissBlurredVC() {
        self.dismiss(animated: true, completion: nil)
    }
}







