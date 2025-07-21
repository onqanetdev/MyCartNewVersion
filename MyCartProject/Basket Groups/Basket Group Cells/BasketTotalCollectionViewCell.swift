//
//  BasketTotalCollectionViewCell.swift
//  MyCartProject
//
//  Created by Onqanet on 14/07/25.
//

import UIKit

class BasketTotalCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    
    static let cellIdentifier = "BasketTotalCollectionViewCell"
    
    let applyCouponCard:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        //view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    let applyCouponImg:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.image = UIImage(named: "discount")
        return img
    }()
    
    
    let applyCouponLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Apply Coupon"
        return lbl
    }()
    
    
    let proceedBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
        btn.addTarget(self, action: #selector(applyCouponFieldShow), for: .touchUpInside)
        btn.tintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        return btn
    }()
    
    
    
    //Payment Details View
    
    let paymentView:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 20
        vw.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.7803921569, blue: 0.8862745098, alpha: 1)
        return vw
    }()
    
    let paymentDetailsLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Payment Details"
        lbl.textColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        return lbl
    }()
    
    
    let borderLine:UIView = {
        let borderLn = UIView()
        borderLn.translatesAutoresizingMaskIntoConstraints = false
        borderLn.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        return borderLn
    }()
    
    //MARK: All the stack views
    let sublineTextStack:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    
    
    let subTotalAmount:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subtotal Amount"
        return lbl
    }()
    
    let shippingChargesLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Shipping Charges"
        return lbl
    }()
    
    
    let subtotalTaxLbl:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subtotal Tax"
        return lbl
    }()
    
    
    let totalAmount:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Total Amount"
        return lbl
    }()
    
    
    let amountStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 8
        return stackView
    }()
    
    
    let subTotalAmountRupees:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = " 4774.0"
        return lbl
    }()
    
    let shippingChargesLblRupees:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0.0"
        return lbl
    }()
    
    
    let subtotalTaxLblTax:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0.0"
        return lbl
    }()
    
    
    let totalAmountRupees:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "4774.0"
        return lbl
    }()
    
    
   //Expanded View Contains
    let expandedView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 21
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        view.isHidden = true
        return view
    }()
    
    let couponTextField:UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Enter coupon code:"
        txtField.layer.cornerRadius = 10
        txtField.tintColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        //txtField.backgroundColor = .blue
        txtField.layer.cornerRadius = 10
        txtField.layer.borderWidth = 1
        txtField.layer.borderColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        txtField.textAlignment = .center // Horizontally center text and placeholder
        txtField.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)

        return txtField
    }()
    
    let applyBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.3269538283, green: 0.1948716342, blue: 0.5487924814, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.setTitle("APPLY", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    var expandedViewHeight:NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        couponTextField.delegate = self
        setUpViewForApplyCoupon()
        setUpViewForTotalAmount()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUpViewForApplyCoupon(){
        contentView.addSubview(applyCouponCard)
        
        applyCouponCard.addSubview(applyCouponImg)
        applyCouponCard.addSubview(applyCouponLbl)
        applyCouponCard.addSubview(proceedBtn)
        
        
        //Expanded View
        
        contentView.addSubview(expandedView)
        expandedView.addSubview(couponTextField)
        expandedView.addSubview(applyBtn)
        
        
        expandedViewHeight = expandedView.heightAnchor.constraint(equalToConstant: 0)
        expandedViewHeight.isActive = true
        
        NSLayoutConstraint.activate([
            applyCouponCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            applyCouponCard.trailingAnchor.constraint(equalTo: contentView
                .trailingAnchor, constant: -10),
            applyCouponCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            applyCouponCard.heightAnchor.constraint(equalToConstant: 70),
            
            applyCouponImg.leadingAnchor.constraint(equalTo: applyCouponCard.leadingAnchor, constant: 10),
            applyCouponImg.centerYAnchor.constraint(equalTo: applyCouponCard.centerYAnchor),
            applyCouponImg.widthAnchor.constraint(equalToConstant: 30),
            applyCouponImg.heightAnchor.constraint(equalToConstant: 30),
            
            applyCouponLbl.leadingAnchor.constraint(equalTo: applyCouponImg.trailingAnchor, constant: 8),
            applyCouponLbl.centerYAnchor.constraint(equalTo: applyCouponCard.centerYAnchor),
            
            
            proceedBtn.trailingAnchor.constraint(equalTo: applyCouponCard.trailingAnchor, constant: -10),
            proceedBtn.centerYAnchor.constraint(equalTo: applyCouponCard.centerYAnchor),
            proceedBtn.widthAnchor.constraint(equalToConstant: 30),
            proceedBtn.heightAnchor.constraint(equalToConstant: 30),
            
           // expandedView.heightAnchor.constraint(equalToConstant: 100),
            expandedView.topAnchor.constraint(equalTo: applyCouponCard.bottomAnchor, constant: -8),
            expandedView.leadingAnchor.constraint(equalTo: applyCouponCard.leadingAnchor),
            expandedView.trailingAnchor.constraint(equalTo: applyCouponCard.trailingAnchor),
            
            
            couponTextField.leadingAnchor.constraint(equalTo: expandedView.leadingAnchor, constant: 10),
            couponTextField.bottomAnchor.constraint(equalTo: expandedView.bottomAnchor, constant: -20),
            couponTextField.heightAnchor.constraint(equalToConstant: 50),
            couponTextField.trailingAnchor.constraint(equalTo: applyBtn.leadingAnchor, constant: -10),
            
            
            applyBtn.bottomAnchor.constraint(equalTo: expandedView.bottomAnchor , constant: -20),
            applyBtn.trailingAnchor.constraint(equalTo: expandedView.trailingAnchor, constant: -10),
            applyBtn.widthAnchor.constraint(equalToConstant: 90),
            applyBtn.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    func setUpViewForTotalAmount(){
        contentView.addSubview(paymentView)
        paymentView.addSubview(paymentDetailsLbl)
        paymentView.addSubview(borderLine)
        
        //Left Side Payment View
        paymentView.addSubview(sublineTextStack)
        sublineTextStack.addArrangedSubview(subTotalAmount)
        sublineTextStack.addArrangedSubview(shippingChargesLbl)
        sublineTextStack.addArrangedSubview(subtotalTaxLbl)
        sublineTextStack.addArrangedSubview(totalAmount)
        
        //Right Side Payment View
        paymentView.addSubview(amountStackView)
        amountStackView.addArrangedSubview(subTotalAmountRupees)
        amountStackView.addArrangedSubview(shippingChargesLblRupees)
        amountStackView.addArrangedSubview(subtotalTaxLblTax)
        amountStackView.addArrangedSubview(totalAmountRupees)
        
        
        
        NSLayoutConstraint.activate([
            paymentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            paymentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            paymentView.topAnchor.constraint(equalTo: expandedView.bottomAnchor, constant: 30),
            paymentView.heightAnchor.constraint(equalToConstant: 190),
            
            
            
            paymentDetailsLbl.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 15),
            paymentDetailsLbl.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 15),
            
            
            borderLine.heightAnchor.constraint(equalToConstant: 1),
            borderLine.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 15),
            borderLine.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -15),
            borderLine.topAnchor.constraint(equalTo: paymentDetailsLbl.bottomAnchor, constant: 10),
            
            
            sublineTextStack.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 18),
            sublineTextStack.topAnchor.constraint(equalTo: borderLine.bottomAnchor, constant: 10),
            
            amountStackView.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -18),
            amountStackView.topAnchor.constraint(equalTo: borderLine.bottomAnchor, constant: 10) ])
    }
    
    
    
    @objc func applyCouponFieldShow(){
        //print("Yayyy!!!!")
        
        if expandedView.isHidden == true {
            expandedView.isHidden = false
            expandedViewHeight.constant = 100
            
            applyCouponCard.layer.cornerRadius = 18
            applyCouponCard.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            proceedBtn.setBackgroundImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
            
            UIView.animate(withDuration: 0.3) {
                self.contentView.layoutIfNeeded()
            }
        } else {
            expandedView.isHidden = true
            expandedViewHeight.constant = 0
            applyCouponCard.layer.cornerRadius = 18
            applyCouponCard.layer.maskedCorners = [
                    .layerMinXMinYCorner,
                    .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner,
                    .layerMaxXMaxYCorner
                ]
            applyCouponCard.clipsToBounds = true
           // applyCouponCard.backgroundColor = .brown
            proceedBtn.setBackgroundImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
            UIView.animate(withDuration: 0.3) {
                self.contentView.layoutIfNeeded()
            }
        }
    
    }
    
    
    
    @objc func didBeginEditing() {
        NotificationCenter.default.post(name: Notification.Name("ScrollToCouponField"), object: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}







