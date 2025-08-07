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
            // Force layout update after text changes
            setNeedsUpdateConstraints()
            invalidateIntrinsicContentSize()
        }
    }

    // MARK: - Subviews ---------------------------------------------------------

    public let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 0
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
        lbl.setContentHuggingPriority(.required, for: .horizontal)
        lbl.setContentCompressionResistancePriority(.required, for: .horizontal)
        return lbl
    }()

    public let imgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "Cosmetics")?.withRenderingMode(.alwaysTemplate) {
            img.image = image
        }
        img.tintColor = .black
        img.setContentHuggingPriority(.required, for: .horizontal)
        img.setContentCompressionResistancePriority(.required, for: .horizontal)
        return img
    }()

    public let underlineView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .yellow
        return v
    }()
    
    public let heightView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Top-left & top-right
        v.clipsToBounds = true
        return v
    }()

    // MARK: - Init --------------------------------------------------------------

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout -----------------------------------------------------------

    private func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleProduct)
        cellView.addSubview(imgView)
        cellView.addSubview(underlineView)
        cellView.addSubview(heightView)

        NSLayoutConstraint.activate([
            // cellView fills the whole contentView
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            // Image at the top-centre
            imgView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0),
            imgView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 18),
            imgView.heightAnchor.constraint(equalToConstant: 16),

            // Title just below the image with horizontal padding
            titleProduct.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            titleProduct.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 8),
            titleProduct.leadingAnchor.constraint(greaterThanOrEqualTo: cellView.leadingAnchor, constant: 12),
            titleProduct.trailingAnchor.constraint(lessThanOrEqualTo: cellView.trailingAnchor, constant: -12),

            // Underline view
            underlineView.centerXAnchor.constraint(equalTo: titleProduct.centerXAnchor),
            underlineView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1),
            
            heightView.heightAnchor.constraint(equalToConstant: 4.5),
            heightView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0),
            heightView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0),
           heightView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 0),
//            heightView.widthAnchor.constraint(equalTo: titleProduct.widthAnchor),
            
            
        ])
    }

    // MARK: - Dynamic Sizing ---------------------------------------------------

    override var intrinsicContentSize: CGSize {
        // Ensure the label has been laid out
        titleProduct.sizeToFit()
        
        // Calculate the width needed for the title with padding
        let titleSize = titleProduct.intrinsicContentSize
        let imageWidth: CGFloat = 16
        
        // Use the wider of the two: title width or image width, plus padding
        let contentWidth = max(titleSize.width + 24, imageWidth + 24) // 12pt padding on each side
        
        // Ensure we have a minimum and maximum width to prevent issues
        let minWidth: CGFloat = 60
        let maxWidth: CGFloat = 250
        let finalWidth = min(max(contentWidth, minWidth), maxWidth)
        
        // Height is fixed based on your layout
        let contentHeight: CGFloat = 45
        
        return CGSize(width: finalWidth, height: contentHeight)
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Force layout to ensure intrinsic content size is calculated properly
        setNeedsLayout()
        layoutIfNeeded()
        
        // Use intrinsic content size directly
        let intrinsicSize = intrinsicContentSize
        
        // Create new layout attributes
        let newLayoutAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
        newLayoutAttributes.frame.size.width = intrinsicSize.width
        
        return newLayoutAttributes
    }
}





