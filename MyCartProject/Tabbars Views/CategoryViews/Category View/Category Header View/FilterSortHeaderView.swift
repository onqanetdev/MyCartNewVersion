//
//  FilterSortHeaderView.swift
//  MyCartProject
//
//  Created by Onqanet on 11/08/25.
//

import UIKit

class FilterSortHeaderView: UICollectionReusableView {
    
    static let headerIdentifier = "FilterSortHeaderView"
    var onTappedFilter:(() -> Void)?
    
    
    private let filtersButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Filters ▼", for: .normal) // ▼ for dropdown look
        btn.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
        btn.tintColor = .black
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
        btn.addTarget(self, action: #selector(filterSelection), for: .touchUpInside)

        // Space between icon and text
        btn.semanticContentAttribute = .forceLeftToRight
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        
        
        return btn
    }()
    
    private let sortButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sort ▼", for: .normal)
        btn.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        btn.tintColor = .black
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
        
        btn.semanticContentAttribute = .forceLeftToRight
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(filtersButton)
        addSubview(sortButton)
        
        NSLayoutConstraint.activate([
            filtersButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            filtersButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            filtersButton.heightAnchor.constraint(equalToConstant: 36),
            filtersButton.widthAnchor.constraint(equalToConstant: 100),
            
            sortButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            sortButton.leadingAnchor.constraint(equalTo: filtersButton.trailingAnchor, constant: 8),
            sortButton.heightAnchor.constraint(equalToConstant: 36),
            sortButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    @objc func filterSelection(){
        onTappedFilter?()
    }
}






