//
//  MainTabBarController.swift
//  MyCartProject
//
//  Created by Onqanet on 07/08/25.
//
//
import UIKit



class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var indicatorViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
        setupTabBarHeight()
        setupTabBarShadow()
        setupTopIndicatorViews()
        updateIndicatorColors(selectedIndex: selectedIndex)
    }
    
    private func setupTabBarHeight() {
        // Set custom tab bar height
        tabBar.frame.size.height = 60
        
        // Adjust safe area to accommodate larger tab bar
        if #available(iOS 11.0, *) {
            additionalSafeAreaInsets.bottom = -20
        }
    }

    private func setupViewControllers() {
        viewControllers = [
            createNavController(vc: HomeViewController(), title: "Home", imageName: "tabHomeIcon"),
            createNavController(vc: CartViewController(), title: "Order Again", imageName: "tabCartIcon"),
            createNavController(vc: CategoryProductViewController(), title: "Categories", imageName: "tabCategoryIcon"),
            createNavController(vc: ProfileViewController(), title: "Profile", imageName: "tabUserIcon")
        ]
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
        
        // Apply spacing using insets and position adjustments
        if let items = tabBar.items {
            for item in items {
                // Move image down significantly
                item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
                
                // Move title down
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Maintain custom tab bar height
        var tabFrame = tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = view.frame.size.height - 100
        tabBar.frame = tabFrame
    }

    private func createNavController(vc: UIViewController, title: String, imageName: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        //nav.tabBarItem.image = UIImage(named: imageName)
        
        if let originalImage = UIImage(named: imageName) {
                // Scale icon relative to tab bar height
                let iconHeight = tabBar.frame.height * 0.6  // 60% of tab bar height
                let iconSize = CGSize(width: iconHeight, height: iconHeight)
                
                let resizedImage = resizeImage(image: originalImage, targetSize: iconSize)
                nav.tabBarItem.image = resizedImage.withRenderingMode(.alwaysOriginal)
            }
        
        return nav
    }
    
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    
    private func setupTabBarShadow() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.15
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 5
        tabBar.layer.masksToBounds = false
    }

    private func setupTopIndicatorViews() {
        guard let tabBarItems = tabBar.items else { return }
        indicatorViews.forEach { $0.removeFromSuperview() }
        indicatorViews.removeAll()
        
        let itemWidth = tabBar.frame.width / CGFloat(tabBarItems.count)
        
        for index in 0..<tabBarItems.count {
            let indicator = UIView()
            indicator.backgroundColor = .white
            indicator.translatesAutoresizingMaskIntoConstraints = false
            
            // Round bottom corners only
            indicator.layer.cornerRadius = 10
            indicator.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            indicator.clipsToBounds = true
            
            tabBar.addSubview(indicator)
            indicatorViews.append(indicator)
            
            NSLayoutConstraint.activate([
                indicator.topAnchor.constraint(equalTo: tabBar.topAnchor),
                indicator.heightAnchor.constraint(equalToConstant: 5),
                indicator.widthAnchor.constraint(equalToConstant: itemWidth - 40),
                indicator.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: CGFloat(index) * itemWidth + 18)
            ])
        }
    }

    private func updateIndicatorColors(selectedIndex: Int) {
        for (index, view) in indicatorViews.enumerated() {
            view.backgroundColor = index == selectedIndex ? .black : .white
        }
    }
}



class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}



// MARK: - UITabBarControllerDelegate
extension MainTabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            updateIndicatorColors(selectedIndex: index)
        }
    }
}







