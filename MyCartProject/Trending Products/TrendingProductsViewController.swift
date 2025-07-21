//
//  TrendingProductsViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 07/07/25.
//

import UIKit

class TrendingProductsViewController: UIViewController {
    
    
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
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        cv.register(TrendingProductsCell.self, forCellWithReuseIdentifier: TrendingProductsCell.cellIdentifier)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()

    
    //Navbar Buttons
    let cartBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "cart"), for: .normal)
        //btn.addTarget(self, action: #selector(movingToCart), for: .touchUpInside)
        btn.tintColor = .white
        return btn
    }()
    
    let sortBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        btn.tintColor = .white
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
       
        configureUI()
        configureCompositionalLayout()
        setUpNavigation()
        setUpConstrains()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(stickyHeaderVw)
        view.addSubview(collectionView)
        stickyHeaderVw.addSubview(backgrounImg)
       // view.addSubview(filterHeaderView)
    }
    
    
    func setUpNavigation(){
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
        
        
        navigationItem.title = "Trending Products"
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Montserrat-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 20

        let cartButtonItem = UIBarButtonItem(customView: cartBtn)
        cartBtn.addTarget(self, action: #selector(movingToCart), for: .touchUpInside)
        let sortButtonItem = UIBarButtonItem(customView: sortBtn)
        navigationItem.rightBarButtonItems = [cartButtonItem, spacer, sortButtonItem]
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
            backgrounImg.trailingAnchor.constraint(equalTo: stickyHeaderVw.trailingAnchor)
        ])
    }
    
    @objc func movingToCart(){
        navigationController?.pushViewController(BasketGroupViewController(), animated: true)
    }
   
}



extension TrendingProductsViewController {
    
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex , environment in
            switch sectionIndex {
            case 0:
                return self.trendingProductsShowingSection()
            default:
                return nil
            }
        }
        
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    
    
    func trendingProductsShowingSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its Group Size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 5)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 3, bottom: 10, trailing: -3)
        
       // section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    
}






