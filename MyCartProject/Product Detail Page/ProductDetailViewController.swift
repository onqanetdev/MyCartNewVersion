//
//  ProductDetailViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 08/07/25.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    
    let stickyHeaderVw : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .clear
        return nv
    }()
    
    
    let backgrounImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "header_background")
        img.contentMode = .scaleToFill
        return img
    }()
    
    let cartBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.setBackgroundImage(UIImage(systemName: "cart"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    
    // Add page control
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        pc.hidesForSinglePage = true
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(ProductBannerCollectionViewCell.self, forCellWithReuseIdentifier: ProductBannerCollectionViewCell.cellIdentifier)
        
        cv.register(ProductDetailsCollectionViewCell.self, forCellWithReuseIdentifier: ProductDetailsCollectionViewCell.cellIdentifier)
        
        cv.register(ProductSegmentCollectionViewCell.self, forCellWithReuseIdentifier: ProductSegmentCollectionViewCell.cellIdentifier)
        
        cv.register(ProductDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: ProductDescriptionCollectionViewCell.cellIdentifier)
        
        cv.register(ProductReviewsCollectionViewCell.self, forCellWithReuseIdentifier: ProductReviewsCollectionViewCell.cellIdentifier)
        
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    
    
    // MARK: - State Management
    enum ContentType {
        case description
        case reviews
    }
    
    public var currentContentType: ContentType = .description
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .brown
        configureUI()
        configureCompositionalLayout()
        setUpNavigation()
        setUpConstrains()
    }
    
    
    func configureUI(){
        view.addSubview(stickyHeaderVw)
        view.addSubview(collectionView)
        
        stickyHeaderVw.addSubview(backgrounImg)
    }
    
    func setUpNavigation(){
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)

        navigationItem.title = "My Cart"
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Montserrat-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 20
        cartBtn.addTarget(self, action: #selector(moveToCart), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartBtn)
    }
    
    
    
    func setUpConstrains(){
        collectionView.setUp(to: view)
        NSLayoutConstraint.activate([
            stickyHeaderVw.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stickyHeaderVw.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stickyHeaderVw.topAnchor.constraint(equalTo: view.topAnchor, constant: -(windowConstant.getTopPadding + 64)),
            stickyHeaderVw.heightAnchor.constraint(equalToConstant: windowConstant.getTopPadding + 64),
            
            backgrounImg.leadingAnchor.constraint(equalTo: stickyHeaderVw.leadingAnchor),
            backgrounImg.topAnchor.constraint(equalTo: stickyHeaderVw.topAnchor),
            backgrounImg.bottomAnchor.constraint(equalTo: stickyHeaderVw.bottomAnchor),
            backgrounImg.trailingAnchor.constraint(equalTo: stickyHeaderVw.trailingAnchor),
            

        ])
    }
    
    @objc func navigateBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Content Type Management
    public func switchToReviews() {
        currentContentType = .reviews
        collectionView.reloadSections(IndexSet(integer: 3))
       
    }
    
    public func switchToDescription() {
        currentContentType = .description
        collectionView.reloadSections(IndexSet(integer: 3))
       
    }
    
    @objc func moveToCart(){
        navigationController?.pushViewController(BasketGroupViewController(), animated: true)
    }
    
    
}


extension ProductDetailViewController {
    
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex , environment in
            switch sectionIndex {
            case 0:
                return self.productBannerSection()
            case 1:
                return self.bannerShowingSection()
            case 2:
                return self.productSegmentShowingSection()
            case 3:
                //return self.productDescriptionShowingSection()
                return self.currentContentType == .description ? self.productDescriptionShowingSection() : self.productReviewsShowingSection()
            default:
                return nil
            }
        }
        
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        // Register the footer view
        collectionView.register(PageControlFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PageControlFooterView.reuseIdentifier)
    }
    
    
    func productBannerSection()-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        // ✅ Update page control using visibleItemsInvalidationHandler
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, environment) in
            guard let self = self else { return }
            let currentPage = Int(round(offset.x / environment.container.contentSize.width))
            DispatchQueue.main.async {
                self.pageControl.currentPage = currentPage
            }
        }
        
        
        // Add footer to the section
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
                section.boundarySupplementaryItems = [footer]
                
                // Keep the visibleItemsInvalidationHandler but update the footer's page control
                section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, environment) in
                    guard let self = self else { return }
                    let currentPage = Int(round(offset.x / environment.container.contentSize.width))
                    DispatchQueue.main.async {
                        // Update the footer's page control
                        if let footerView = self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionFooter, at: IndexPath(item: 0, section: 0)) as? PageControlFooterView {
                            footerView.pageControl.currentPage = currentPage
                        }
                    }
                }
        
        
        
        return section
    }
    
    
    
    func bannerShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its group image
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    
    
    func productSegmentShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its group image
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    
    func productDescriptionShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its group image
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    
    func productReviewsShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its group image
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(350))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
}




