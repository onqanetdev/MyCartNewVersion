//
//  ProductDetailViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 09/07/25.
//

import Foundation
import UIKit



extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return allTrendingProducts.count
        case 1:
            return productDetails.count
        case 2:
            return 1
        case 3:
            return 1
            // Hide section 3 when showing reviews
           // return currentContentType == .description ? 1 : 0
        default:
            return 1
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductBannerCollectionViewCell.cellIdentifier, for: indexPath) as?
                    ProductBannerCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = allTrendingProducts[indexPath.row]
            //cell.cardView.backgroundColor = .white
            cell.backgroundColor = .clear
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailsCollectionViewCell.cellIdentifier, for: indexPath) as?
                    ProductDetailsCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = productDetails[indexPath.row]
            //cell.cardView.backgroundColor = .white
            cell.backgroundColor = .clear
            return cell
            
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSegmentCollectionViewCell.cellIdentifier, for: indexPath) as?
                    ProductSegmentCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .clear
            // Handle segment taps
            cell.onReviewsTapped = { [weak self] in
                self?.switchToReviews()
            }
            
            cell.onDescriptionTapped = { [weak self] in
                self?.switchToDescription()
            }
            
            
            return cell
            
        case 3:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDescriptionCollectionViewCell.cellIdentifier, for: indexPath) as?
//                    ProductDescriptionCollectionViewCell else {fatalError("Unable deque cell...")}
//            cell.backgroundColor = .clear
//            
//            return cell
            
            
            if currentContentType == .description {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDescriptionCollectionViewCell.cellIdentifier, for: indexPath) as? ProductDescriptionCollectionViewCell else {
                    fatalError("Unable deque cell...")
                }
                cell.backgroundColor = .clear
                return cell
            } else {
                // Show reviews cell
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductReviewsCollectionViewCell.cellIdentifier, for: indexPath) as? ProductReviewsCollectionViewCell else {
                    fatalError("Unable deque cell...")
                }
                cell.backgroundColor = .clear
                return cell
            }
            
            
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //navigationController?.pushViewController(ProductDetailViewController(), animated: true)
    }
    
    
    // MARK: - Supplementary View (Footer)
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter && indexPath.section == 0 {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PageControlFooterView.reuseIdentifier, for: indexPath) as! PageControlFooterView
            
            // Configure the page control
            footerView.pageControl.numberOfPages = allTrendingProducts.count
            footerView.pageControl.currentPage = 0
            
            return footerView
        }
        
        return UICollectionReusableView()
    }
}





