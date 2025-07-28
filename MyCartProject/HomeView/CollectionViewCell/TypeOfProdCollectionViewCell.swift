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

    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    public let titleProduct: UILabel = {
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
    
    public let imgView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "Cosmetics")?.withRenderingMode(.alwaysTemplate) {
            img.image = image
        }
        img.tintColor = .black
        return img
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
        cellView.addSubview(imgView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imgView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 7),
            imgView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 16),
            imgView.heightAnchor.constraint(equalToConstant: 16),
            
            titleProduct.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            titleProduct.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 4),
            titleProduct.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -7)
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








