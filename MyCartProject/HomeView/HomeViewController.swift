//
//  HomeViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    // private let headerView = HeaderView()
     
     
     lazy var typeProductsCollectionView: UICollectionView = {
         let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.showsVerticalScrollIndicator = false
         cv.dataSource = self
         cv.delegate = self
         cv.register(TypeOfProdCollectionViewCell.self, forCellWithReuseIdentifier: TypeOfProdCollectionViewCell.cellIdentifier)
         cv.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.cellIdentifier)
         cv.register(GroceryCollectionViewCell.self, forCellWithReuseIdentifier: GroceryCollectionViewCell.cellIdentifier)
         cv.register(TrendingProductCollectionViewCell.self, forCellWithReuseIdentifier: TrendingProductCollectionViewCell.cellIdentifier)
         cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
         
         
         //Header View Registering
         
         cv.register(GroceryKitchenHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier)
         cv.register(TrendingProductsHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: TrendingProductsHeaderView.headerIdentifier)
         
         cv.register(AllProductsHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: AllProductsHeaderView.headerIdentifier)
         cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: "EmptyHeader")

         cv.contentInsetAdjustmentBehavior = .never
         cv.backgroundColor = .clear
         
        
         return cv
     }()
     
     
     let sideMenuManager = SideMenuManager()
     
    private var isSideMenuSetup = false
    
    
    
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        // setupHeaderView()
         //sideMenuManager.setup(in: self)
         navigationController?.isNavigationBarHidden = true
         navigationController?.navigationBar.isHidden = true
         
         
         configureUI()
         configureCompositionalLayout()
        
         
         //sideMenuManager.setup(in: self)
     }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
    }
     
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !isSideMenuSetup {
            sideMenuManager.setup(in: self)
            isSideMenuSetup = true
        }
    }
    
    
    

     private func configureUI() {
         //view.backgroundColor = .white
         view.addSubview(typeProductsCollectionView)

         NSLayoutConstraint.activate([
             typeProductsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -16),
             typeProductsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
             typeProductsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             typeProductsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
         ])
     }
 }



extension HomeViewController {
    
    //Defining Compositional layout
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.typesOfProductsSection()
            case 1:
                return self.bannerShowingSection()
            case 2:
                return self.groceryShowingSection()
            case 3:
                return self.trendingProductsShowingSection()
            default:
                return nil
            }
            
        }
        
        
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        
      
        
        typeProductsCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    

    //Defining First Section
    
    
    func typesOfProductsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(80), // Reasonable starting estimate
            heightDimension: .absolute(40)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(80), // Same as item
            heightDimension: .absolute(40)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8 // Space between groups (items)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        
        // Header view
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                   heightDimension: .estimated(220)),
                  elementKind: "Header",
                  alignment: .top)
        ]
        
        // Background decoration
        let backgroundItem = NSCollectionLayoutDecorationItem.background(
            elementKind: SectionBackgroundView.elementKind
        )
        section.decorationItems = [backgroundItem]
        
        return section
    }
    
    
    
    
    
    
    
    func bannerShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its group image
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    
    
    func groceryShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)
        
        //section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top)
        ]
        
        
        
        
        return section
    }
    
    
    
    
    func trendingProductsShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its Group Size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        //For HeaderSection
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top)
        ]
        
        
        
        
        return section
    }
    
    
}





