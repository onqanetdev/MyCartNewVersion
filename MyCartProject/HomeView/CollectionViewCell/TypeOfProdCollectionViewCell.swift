//
//  TypeOfProdCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 04/07/25.
//

import UIKit



class TypeOfProdCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "TypeOfProductCell"
    
    var cellData: TypesOfProducts? {
        didSet {
            guard let cellData = cellData else { return }
            titleProduct.text = cellData.nameOfType
            invalidateIntrinsicContentSize()
        }
    }

    private let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private let titleProduct: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont(name: "Helvetica-Bold", size: 14)
       
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        // These are crucial for proper sizing
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleProduct)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleProduct.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            titleProduct.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            titleProduct.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16)
        ])
        
        
        
    }
    
    // Simpler approach - calculate intrinsic content size
    override var intrinsicContentSize: CGSize {
        let labelSize = titleProduct.intrinsicContentSize
        let width = labelSize.width + 32 // 16 padding on each side
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
}








