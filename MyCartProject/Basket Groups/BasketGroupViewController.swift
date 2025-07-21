//
//  BasketGroupViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 11/07/25.
//

import UIKit

class BasketGroupViewController: UIViewController {
    
    
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
        cv.register(BasketGroupCollectionViewCell.self, forCellWithReuseIdentifier: BasketGroupCollectionViewCell.cellIdentifier)
        cv.register(BasketTotalCollectionViewCell.self, forCellWithReuseIdentifier: BasketTotalCollectionViewCell.cellIdentifier)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    
    
    
    let finalAmountView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9505864978, green: 0.9303696752, blue: 0.9908335805, alpha: 1)
        return view
    }()
    
    
    
    let grandTotalView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    let grandTotalLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Grand Total"
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let rupeesLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rs. 500/-"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    let proceedbtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Proceed", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    
    var finalAmountViewBottomConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        
        
        configureUI()
        setUpNavigation()
        setUpConstrains()
        configureCompositionalLayout()
        setUpViewFinalView()
        
    
        // 👇 Keyboard observers
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            // 👇 Tap gesture to dismiss keyboard
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)

            // 👇 Scroll to coupon field when editing begins
            NotificationCenter.default.addObserver(self, selector: #selector(scrollToCouponField(_:)), name: Notification.Name("ScrollToCouponField"), object: nil)
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
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .bold) // Optional: custom font
        ]
        
        navigationItem.title = "My Cart"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        
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
    

    
    func setUpViewFinalView(){
        view.addSubview(finalAmountView)
        finalAmountView.addSubview(proceedbtn)
        finalAmountView.addSubview(grandTotalView)
        grandTotalView.addArrangedSubview(grandTotalLbl)
        grandTotalView.addArrangedSubview(rupeesLbl)
        
        // Create the bottom constraint properly - use view.bottomAnchor to stick to actual bottom
        finalAmountViewBottomConstraint = finalAmountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        finalAmountViewBottomConstraint.isActive = true

        NSLayoutConstraint.activate([
            finalAmountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            finalAmountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            finalAmountView.heightAnchor.constraint(equalToConstant: 100),
            
            proceedbtn.widthAnchor.constraint(equalToConstant: 160),
            proceedbtn.heightAnchor.constraint(equalToConstant: 50),
            proceedbtn.trailingAnchor.constraint(equalTo: finalAmountView.trailingAnchor, constant: -15),
            proceedbtn.topAnchor.constraint(equalTo: finalAmountView.topAnchor, constant: 10),
            
            grandTotalView.leadingAnchor.constraint(equalTo: finalAmountView.leadingAnchor, constant: 17),
            grandTotalView.centerYAnchor.constraint(equalTo: proceedbtn.centerYAnchor),
        ])
    }

    // Alternative keyboard handling method
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        // Get keyboard height and adjust for safe area
        let keyboardHeight = keyboardFrame.height
        let safeAreaBottom = view.safeAreaInsets.bottom
        
        // On devices with home indicator, we need to account for safe area
        let adjustedKeyboardHeight = keyboardHeight - safeAreaBottom + 0
        
        // Move finalAmountView above the keyboard
        finalAmountViewBottomConstraint.constant = -adjustedKeyboardHeight
        
        UIView.animate(withDuration: animationDuration) {
            self.collectionView.contentInset.bottom = adjustedKeyboardHeight + self.finalAmountView.frame.height
            self.collectionView.scrollIndicatorInsets.bottom = adjustedKeyboardHeight + self.finalAmountView.frame.height
            self.view.layoutIfNeeded()
        }
    }
    
    

    
    @objc func keyboardWillHide(_ notification: Notification) {
        finalAmountViewBottomConstraint.constant = 0

        UIView.animate(withDuration: 0.3) {
            self.collectionView.contentInset = .zero
            self.collectionView.scrollIndicatorInsets = .zero
            self.view.layoutIfNeeded()
        }
    }

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    
    @objc func scrollToCouponField(_ notification: Notification) {
        guard let cell = notification.object as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else { return }

        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }

    
}


extension BasketGroupViewController {
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self.restaurantsListSection()
            case 1:
                return self.applyCouponSection()
            default:
                return nil
            }
        }
        
        layout.register(SectionBackgroundView.self, forDecorationViewOfKind: SectionBackgroundView.elementKind)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    
    func restaurantsListSection()->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 2, trailing: 15)
        
                
        return section
    }
    
    
    func applyCouponSection()->NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(350))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 50, trailing: 15)
        
                
        return section
    }
    
}





