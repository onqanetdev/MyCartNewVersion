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
    
    
    //var categoriesCollectionView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // A neutral background for the main view
            
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        
        if #available(iOS 18.0, *) {
            tabBarController?.isTabBarHidden = true
            tabBarController?.tabBar.isHidden = true
        } else {
            // Fallback on earlier versions
            tabBarController?.tabBar.isHidden = true
        }
        
        setUpNavigation()
        setUpHeaderView()
        
        setupSideMenu()
        
        setupMainContentArea()
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
        
        navigationItem.title = "Categories"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
    }
    
    
    
    func setUpHeaderView(){
        view.addSubview(stickyHeaderVw)
        stickyHeaderVw.addSubview(backgrounImg)
    
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
    
    
    
    private func setupSideMenu() {
        sideMenuView = CustomSideMenuView()
        view.addSubview(sideMenuView)
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false

        // Set up constraints for the side menu to be fixed on the left
        let screenWidth = view.bounds.width
        let sideMenuWidth = screenWidth * 0.20 // Takes 40% of the screen width

        NSLayoutConstraint.activate([
            sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), // Fixed to the left edge
            sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenuView.widthAnchor.constraint(equalToConstant: sideMenuWidth)
        ])
    }

    
    
    @objc func navigateBack(){
        navigationController?.popViewController(animated: true)
    }
    
    private func setupMainContentArea() {
        // Initialize your custom collection view
        let categoriesCollectionView = CategoryMainView()
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.backgroundColor = .clear
        // Hook up callback from header -> main view -> view controller
        categoriesCollectionView.onFilterButtonTapped = { [weak self] in
                self?.handleFilterTapped()
            }
        // Add to the view hierarchy
        view.addSubview(categoriesCollectionView)
        
        // Set constraints so it sits right next to the side menu
        NSLayoutConstraint.activate([
            categoriesCollectionView.leadingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
            categoriesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10) // small right padding
        ])
    }
    
    private func handleFilterTapped() {
        print("Filter button tapped in header — handled in ViewController!")
        // guard let self = self else { return }
       // let filterVC = GlassyViewController()
        let filterVC = BlurredViewController()
        filterVC.modalPresentationStyle = .overCurrentContext
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: true)
    }
}









