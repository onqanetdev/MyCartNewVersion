//
//  CategoryProductViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 11/08/25.
//

import UIKit

class CategoryProductViewController: UIViewController {
    
    
    lazy var typeProductsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        
        cv.register(GroceryCollectionViewCell.self, forCellWithReuseIdentifier: GroceryCollectionViewCell.cellIdentifier)
       
        cv.register(SnackesAndDrinksCell.self, forCellWithReuseIdentifier: SnackesAndDrinksCell.cellIdentifier)
        cv.register(BeautyAndPersonalCareCell.self, forCellWithReuseIdentifier: BeautyAndPersonalCareCell.cellIdentifier)
        
        cv.register(HouseHoldEssentialCell.self, forCellWithReuseIdentifier: HouseHoldEssentialCell.cellIdentifier)
        cv.register(ShopByStoreCell.self, forCellWithReuseIdentifier: ShopByStoreCell.cellIdentifier)
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        
        //Header View Registering
        
        cv.register(AllProductsHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: AllProductsHeaderView.headerIdentifier)
        
        cv.register(GroceryKitchenHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier)
        
        
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: "EmptyHeader")

        
        cv.contentInsetAdjustmentBehavior = .never
        cv.backgroundColor = .clear
        
       
        return cv
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
        configureUI()
        configureCompositionalLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
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
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.headerSectionViewShowing()
            case 1:
                return self.groceryShowingSection()
            case 2:
                return self.snacksAndDrinksShowingSection()
//            case 3:
//                return self.beautyAndPersonalShowingSection()
//            case 4:
//                return self.householdEssentialShowingSection()
//            case 5:
//                return self.shopByStoreShowingSection()
            default:
                return nil
            }
            
        }
        
        
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
    
        typeProductsCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    

}



extension CategoryProductViewController {
    
    func headerSectionViewShowing() -> NSCollectionLayoutSection {
        
           SectionBackgroundView.bottomCornerRadius = 30
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
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), elementKind: "Header", alignment: .top)
        ]
        
        let backgroundItem = NSCollectionLayoutDecorationItem.background(
            elementKind: SectionBackgroundView.elementKind
        )
        section.decorationItems = [backgroundItem]
        
        
        
        return section
    }
    
    func groceryShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
        
        //section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top)
        ]
        
        return section
    }

    
    func snacksAndDrinksShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 150, trailing: 0)
        
        //section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top)
        ]
        
        return section
    }
    
    
    
    func beautyAndPersonalShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
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
    
    
    func householdEssentialShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
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
    
    
    func shopByStoreShowingSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 120, trailing: 0)
        
        //section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind: "Header", alignment: .top)
        ]
        
        return section
    }

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Disable bounce only when at the top
        if scrollView.contentOffset.y <= 0 {
            if scrollView.bounces {
                scrollView.bounces = false
            }
        } else {
            if !scrollView.bounces {
                scrollView.bounces = true
            }
        }
    }
}






