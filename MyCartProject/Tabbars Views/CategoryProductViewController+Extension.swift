//
//  CategoryProductViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 11/08/25.
//

import UIKit



extension CategoryProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            //return grocery.count
            return 0
        case 1:
            return grocery.count
        case 2:
            return snacks.count
        case 3:
            //return beauty.count
            return 0
        case 4:
            //return essentials.count
            return 0
        case 5:
            //return stores.count
            return 0
        default:
            return 4
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
            //   case 0:
            //            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.cellIdentifier, for: indexPath) as?
            //                    GroceryCollectionViewCell else {fatalError("Unable deque cell...")}
            //            cell.cellData = grocery[indexPath.row]
            //            cell.backgroundColor = .clear
            //            return cell
            
        case 1:
            
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.cellIdentifier, for: indexPath) as?
                    GroceryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = grocery[indexPath.row]
            cell.backgroundColor = .clear
            return cell
            
        case 2:
            
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SnackesAndDrinksCell.cellIdentifier, for: indexPath) as?
                    SnackesAndDrinksCell else {fatalError("Unable deque cell...")}
            cell.cellData = snacks[indexPath.row]
            cell.backgroundColor = .clear
            return cell
            
//        case 3:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeautyAndPersonalCareCell.cellIdentifier, for: indexPath) as?
//                    BeautyAndPersonalCareCell else {fatalError("Unable deque cell...")}
//            cell.cellData = beauty[indexPath.row]
//            cell.backgroundColor = .clear
//            return cell
//            
//        case 4:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseHoldEssentialCell.cellIdentifier, for: indexPath) as?
//                    HouseHoldEssentialCell else {fatalError("Unable deque cell...")}
//            cell.cellData = essentials[indexPath.row]
//            cell.backgroundColor = .clear
//            return cell
//        case 5:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopByStoreCell.cellIdentifier, for: indexPath) as?
//                    ShopByStoreCell else {fatalError("Unable deque cell...")}
//            cell.cellData = stores[indexPath.row]
//            cell.backgroundColor = .clear
//            return cell
//            
            
            
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
//                header.onCartTapped = { [weak self] in
//                    let vc = BasketGroupViewController()
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//                
//                header.onHamburgerTapped = { [weak self] in
//                    
//                    //self?.sideMenuManager.toggleSideMenu()
//                }
//                
//                header.onBellIconTapped = { [weak self] in
//                    self?.navigationController?.pushViewController(NotificationViewController(), animated: true)
//                }
                
                return header
                
            case 1:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                //header.headerTitle.text = "Bestsellers"
                header.viewAll.isHidden = true
                return header
                

            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                header.headerTitle.text = "Snacks & Drinks"
                header.viewAll.isHidden = true
                return header
                
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                header.headerTitle.text = "Beauty & Personal Care"
                header.viewAll.isHidden = true
                return header
            case 4:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                header.headerTitle.text = "Households Essential"
                header.viewAll.isHidden = true
                return header
            case 5:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                header.backgroundColor = .clear
                header.headerTitle.text = "Shop by store"
                header.viewAll.isHidden = true
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
        navigationController?.pushViewController(CategoriesViewController(), animated: true)
    }
    
}




