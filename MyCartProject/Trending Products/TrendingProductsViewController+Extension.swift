//
//  TrendingProductsViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 07/07/25.
//

import Foundation
import UIKit



extension TrendingProductsViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return trendingProducts.count
        default:
            return 1
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingProductsCell.cellIdentifier, for: indexPath) as?
                    TrendingProductsCell else {fatalError("Unable deque cell...")}
            cell.cellData = allTrendingProducts[indexPath.row]
            cell.cardView.backgroundColor = .white
            cell.backgroundColor = .clear
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ProductDetailViewController(), animated: true)
    }
}



extension TrendingProductsViewController {
    @objc func navigateBack(){
        navigationController?.popViewController(animated: true)
    }
}





