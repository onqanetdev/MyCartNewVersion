//
//  PageControlFooterView.swift
//  MyCartProject
//
//  Created by Onqanet on 10/07/25.
//

import UIKit

class PageControlFooterView: UICollectionReusableView {
    static let reuseIdentifier = "PageControlFooterView"
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        pc.hidesForSinglePage = true
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
