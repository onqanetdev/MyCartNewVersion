//
//  CategoriesViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 07/08/25.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    private var sideMenuView: CustomSideMenuView!
    // No toggle button or animation logic needed as the view is fixed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // A neutral background for the main view
        
        setupSideMenu()
        setupMainContentArea() // Add a placeholder for your main content
        
    
        navigationController?.navigationBar.isHidden = true
        navigationController?.isNavigationBarHidden = true
        
        if #available(iOS 18.0, *) {
            tabBarController?.isTabBarHidden = true
            tabBarController?.tabBar.isHidden = true
        } else {
            // Fallback on earlier versions
            tabBarController?.tabBar.isHidden = true
        }
    }

    private func setupSideMenu() {
        sideMenuView = CustomSideMenuView()
        view.addSubview(sideMenuView)
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false

        // Set up constraints for the side menu to be fixed on the left
        let screenWidth = view.bounds.width
        let sideMenuWidth = screenWidth * 0.40 // Takes 40% of the screen width

        NSLayoutConstraint.activate([
            sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), // Fixed to the left edge
            sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sideMenuView.widthAnchor.constraint(equalToConstant: sideMenuWidth)
        ])
    }

    private func setupMainContentArea() {
        // This is a placeholder for your main content area that would sit next to the side menu.
        let mainContentView = UIView()
        mainContentView.backgroundColor = .systemGray5 // A distinct color for the content area
        mainContentView.layer.cornerRadius = 10
        mainContentView.layer.masksToBounds = true // Clip content to bounds if it goes outside rounded corners
        view.addSubview(mainContentView)
        mainContentView.translatesAutoresizingMaskIntoConstraints = false

        // Constraints for the main content view, positioned to the right of the side menu
        NSLayoutConstraint.activate([
            mainContentView.leadingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: 10), // 10pt spacing from side menu
            mainContentView.topAnchor.constraint(equalTo: view.topAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10) // 10pt spacing from right edge
        ])

        // Add a label to the main content view for demonstration
        let contentLabel = UILabel()
        contentLabel.text = "Your Main Content Goes Here"
        contentLabel.textAlignment = .center
        contentLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        contentLabel.textColor = .label
        mainContentView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: mainContentView.centerYAnchor)
        ])
    }
}









