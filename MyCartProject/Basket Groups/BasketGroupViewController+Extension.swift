//
//  BasketGroupViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 11/07/25.
//

import Foundation
import UIKit




extension BasketGroupViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return restaurantListMockData.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketGroupCollectionViewCell.cellIdentifier, for: indexPath) as? BasketGroupCollectionViewCell else {fatalError("Unable deque cell...")}
                cell.cellData = restaurantListMockData[indexPath.row]
             return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketTotalCollectionViewCell.cellIdentifier, for: indexPath) as? BasketTotalCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.onTappedSelectAdd = { 
                let vc = ChangeAddressViewController()
                vc.modalPresentationStyle = .overCurrentContext
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
            }
            
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
        }
        
    }
    
}





