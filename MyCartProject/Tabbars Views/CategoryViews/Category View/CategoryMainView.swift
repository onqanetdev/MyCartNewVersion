//
//  CategoryMainView.swift
//  MyCartProject
//
//  Created by Onqanet on 08/08/25.
//

import UIKit

class CategoryMainView: UIView {

    lazy var categoryMainViewCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(CategoryMainViewCollectionViewCell.self, forCellWithReuseIdentifier: CategoryMainViewCollectionViewCell.cellIdentifier)
       
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        cv.register(FilterSortHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FilterSortHeaderView.headerIdentifier)
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: "EmptyHeader")
        
        
        cv.contentInsetAdjustmentBehavior = .never
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        setUpView()
        configureCompositionalLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
    
    
    
    
    func setUpView() {
        addSubview(categoryMainViewCollectionView)
        
        NSLayoutConstraint.activate([
            categoryMainViewCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryMainViewCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            categoryMainViewCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            categoryMainViewCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
    }
    
    
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.typesOfProductsSection()
        
            default:
                return nil
            }
            
        }
        
        
//        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
    
        categoryMainViewCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    

    
    //All Compositionla
    
    //Defining First Section
   
    func typesOfProductsSection() -> NSCollectionLayoutSection {
        // Padding between items
        let padding: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        
        // Calculate width per item
        let availableWidth = categoryMainViewCollectionView.bounds.width - (padding * (itemsPerRow + 1))
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem * 1.96 // Adjust height ratio as needed
        
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(widthPerItem),
            heightDimension: .absolute(heightPerItem)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Set spacing between items inside the group
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: 0)
        
        // Group (horizontal: 2 items per row)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(heightPerItem)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item] // Two items in a row
        )
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = padding
        section.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        
    
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(50) // fixed height for header
            ),
            elementKind: "Header",
            alignment: .top
        )
        header.pinToVisibleBounds = true // 👈 Makes it sticky

        section.boundarySupplementaryItems = [header]
        
        
        
        return section
    }

    
}





extension CategoryMainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return demoCategories.count
        default:
            return 0
        }
       
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryMainViewCollectionViewCell.cellIdentifier, for: indexPath) as?
                    CategoryMainViewCollectionViewCell else {fatalError("Unable deque cell...")}
            //cell.cellData = demoCategories[indexPath.row]
            cell.configure(with: demoCategories[indexPath.row])
            cell.backgroundColor = .clear
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterSortHeaderView.headerIdentifier, for: indexPath) as! FilterSortHeaderView
                //header.delegate = self
                header.backgroundColor = .white
               
                
                return header
                
          
                
            default:
                let emptyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EmptyHeader", for: indexPath)
                return emptyHeader
            }
        } else {
            let emptyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EmptyHeader", for: indexPath)
            return emptyHeader
        }
    }
    
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        // Example: 2 items per row with spacing
//        let padding: CGFloat = 10
//        let itemsPerRow: CGFloat = 2
//        let availableWidth = collectionView.bounds.width - (padding * (itemsPerRow + 1))
//        let widthPerItem = availableWidth / itemsPerRow
//        
//        // Example: Fixed height or proportional
//        return CGSize(width: widthPerItem, height: widthPerItem * 1.96)
//    }

    
}
