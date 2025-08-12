//
//  HomeViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import Foundation
import UIKit



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return typesOfProduct.count
        case 1:
            return bannerAd.count
        case 2:
            return grocery.count
        case 3:
            return trendingProducts.count
        default:
            return 4
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfProdCollectionViewCell.cellIdentifier, for: indexPath) as?
                    TypeOfProdCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = typesOfProduct[indexPath.row]
            
            cell.backgroundColor = .clear
            
            // Apply selection logic
            if indexPath == selectedIndex {
                cell.cellView.backgroundColor = .clear
                cell.titleProduct.textColor = .white
                cell.imgView.tintColor = .white
                cell.underlineView.backgroundColor = .white
                cell.heightView.isHidden = false
            } else {
                cell.cellView.backgroundColor = .clear
                cell.titleProduct.textColor = .white
                cell.imgView.tintColor = .white
                cell.underlineView.backgroundColor = .white
                cell.heightView.isHidden = true
            }
            
            return cell
            
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellIdentifier, for: indexPath) as?
                    BannerCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = bannerAd[indexPath.row]
            cell.backgroundColor = .clear
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.cellIdentifier, for: indexPath) as?
                    GroceryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = grocery[indexPath.row]
            cell.backgroundColor = .clear
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingProductCollectionViewCell.cellIdentifier, for: indexPath) as?
                    TrendingProductCollectionViewCell else {fatalError("Unable deque cell...")}
            
            cell.cellData = trendingProducts[indexPath.row]
            
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
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AllProductsHeaderView.headerIdentifier, for: indexPath) as! AllProductsHeaderView
                //header.delegate = self
                header.backgroundColor = .clear
                header.onCartTapped = { [weak self] in
                    let vc = BasketGroupViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
                
                header.onHamburgerTapped = { [weak self] in
                    
                    self?.sideMenuManager.toggleSideMenu()
                }
                
                header.onBellIconTapped = { [weak self] in
                    self?.navigationController?.pushViewController(NotificationViewController(), animated: true)
                }
                
                return header
                
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                return header
                
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingProductsHeaderView.headerIdentifier, for: indexPath) as! TrendingProductsHeaderView
                header.backgroundColor = .clear
                header.onViewAllTapped = { [weak self] in
                    let vc = TrendingProductsViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
                //header.delegate = self
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
                
            let previousIndex = selectedIndex
                selectedIndex = indexPath

                var indexesToReload = [indexPath]
                if previousIndex != indexPath {
                    indexesToReload.append(previousIndex)
                }

                collectionView.reloadItems(at: indexesToReload)
            
        default:
            print("Default Print")
        }
        
        
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




