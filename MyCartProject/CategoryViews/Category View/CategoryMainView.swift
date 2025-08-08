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
        
        cv.contentInsetAdjustmentBehavior = .never
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        setUpView()
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
    
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Example: 2 items per row with spacing
        let padding: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        let availableWidth = collectionView.bounds.width - (padding * (itemsPerRow + 1))
        let widthPerItem = availableWidth / itemsPerRow
        
        // Example: Fixed height or proportional
        return CGSize(width: widthPerItem, height: widthPerItem * 1.66)
    }

    
}
