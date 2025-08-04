//
//  OrderSuccessViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 31/07/25.
//

import UIKit

class OrderSuccessViewController: UIViewController {
    
    // MARK: - UI Elements
    private let checkmarkCircle = UIView()
    private let checkmarkPath = UIBezierPath()
    private let checkmarkLayer = CAShapeLayer()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let trackButton = UIButton(type: .system)
    private let backButton = UIButton(type: .system)
    
    // Floating elements
    private var floatingElements: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFloatingElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
        
        // Setup checkmark circle
        checkmarkCircle.backgroundColor = UIColor.systemRed
        checkmarkCircle.layer.cornerRadius = 75
        checkmarkCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkmarkCircle)
        
        // Add inner circle border
        let innerBorder = CALayer()
        innerBorder.frame = CGRect(x: 8, y: 8, width: 134, height: 134)
        innerBorder.cornerRadius = 67
        innerBorder.borderWidth = 2
        innerBorder.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        checkmarkCircle.layer.addSublayer(innerBorder)
        
        // Setup checkmark path
        checkmarkPath.move(to: CGPoint(x: 45, y: 75))
        checkmarkPath.addLine(to: CGPoint(x: 65, y: 95))
        checkmarkPath.addLine(to: CGPoint(x: 105, y: 55))
        
        checkmarkLayer.path = checkmarkPath.cgPath
        checkmarkLayer.strokeColor = UIColor.white.cgColor
        checkmarkLayer.fillColor = UIColor.clear.cgColor
        checkmarkLayer.lineWidth = 6
        checkmarkLayer.lineCap = .round
        checkmarkLayer.lineJoin = .round
        checkmarkLayer.strokeEnd = 0
        checkmarkCircle.layer.addSublayer(checkmarkLayer)
        
        // Setup title label
        titleLabel.text = "Your Order has been\naccepted"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.alpha = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Setup subtitle label
        subtitleLabel.text = "Your items has been placcd and is on\nit's way to being processed"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 2
        subtitleLabel.alpha = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        
        // Setup track button
        trackButton.setTitle("Track Order", for: .normal)
        trackButton.backgroundColor = UIColor.systemRed
        trackButton.setTitleColor(.white, for: .normal)
        trackButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        trackButton.layer.cornerRadius = 25
        trackButton.alpha = 0
        trackButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackButton)
        
        // Setup back button
        backButton.setTitle("Back to home", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        backButton.alpha = 0
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(dismissalView), for: .touchUpInside)
        view.addSubview(backButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Checkmark circle
            checkmarkCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkmarkCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            checkmarkCircle.widthAnchor.constraint(equalToConstant: 150),
            checkmarkCircle.heightAnchor.constraint(equalToConstant: 150),
            
            // Title label
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: checkmarkCircle.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // Subtitle label
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            // Track button
            trackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            trackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            trackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            trackButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Back button
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: trackButton.bottomAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    @objc func dismissalView(){
        self.dismiss(animated: true)
    }
    
    
    private func setupFloatingElements() {
        let colors: [UIColor] = [
            .systemGreen, .systemRed, .systemBlue, .systemOrange,
            .systemPurple, .systemYellow, .systemTeal
        ]
        
        // Create floating circles and curved lines
        for i in 0..<8 {
            if i % 2 == 0 {
                // Create circle
                let circle = UIView()
                let size: CGFloat = i == 0 ? 20 : (i == 2 ? 12 : 16)
                circle.frame = CGRect(x: 0, y: 0, width: size, height: size)
                circle.backgroundColor = colors[i % colors.count]
                circle.layer.cornerRadius = size / 2
                circle.alpha = 0
                view.addSubview(circle)
                floatingElements.append(circle)
            } else {
                // Create curved line
                let curveView = UIView()
                curveView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                
                let curveLayer = CAShapeLayer()
                let curvePath = UIBezierPath()
                curvePath.move(to: CGPoint(x: 5, y: 20))
                curvePath.addQuadCurve(to: CGPoint(x: 35, y: 15), controlPoint: CGPoint(x: 20, y: 5))
                
                curveLayer.path = curvePath.cgPath
                curveLayer.strokeColor = colors[i % colors.count].cgColor
                curveLayer.fillColor = UIColor.clear.cgColor
                curveLayer.lineWidth = 3
                curveLayer.lineCap = .round
                
                curveView.layer.addSublayer(curveLayer)
                curveView.alpha = 0
                view.addSubview(curveView)
                floatingElements.append(curveView)
            }
        }
    }
    
    private func startAnimation() {
        // Initial scale animation for circle
        checkmarkCircle.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        // Animate circle appearance
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: {
            self.checkmarkCircle.transform = .identity
        }) { _ in
            // Animate checkmark drawing
            self.animateCheckmark()
        }
    }
    
    private func animateCheckmark() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.animateFloatingElements()
            self.animateTextAndButtons()
        }
        
        checkmarkLayer.add(animation, forKey: "checkmarkAnimation")
        checkmarkLayer.strokeEnd = 1
        
        CATransaction.commit()
    }
    
    private func animateFloatingElements() {
        let centerX = view.frame.width / 2
        let centerY = checkmarkCircle.center.y
        
        let positions: [CGPoint] = [
            CGPoint(x: centerX - 120, y: centerY - 80), // Green circle top-left
            CGPoint(x: centerX - 60, y: centerY - 120),  // Blue curve top
            CGPoint(x: centerX + 100, y: centerY - 60),  // Red circle top-right
            CGPoint(x: centerX + 120, y: centerY + 20),  // Orange curve right
            CGPoint(x: centerX - 140, y: centerY + 40),  // Orange circle left
            CGPoint(x: centerX - 80, y: centerY + 100),  // Blue curve bottom-left
            CGPoint(x: centerX + 80, y: centerY + 80),   // Green circle bottom-right
            CGPoint(x: centerX + 40, y: centerY + 120)   // Purple curve bottom
        ]
        
        for (index, element) in floatingElements.enumerated() {
            element.center = CGPoint(x: centerX, y: centerY)
            
            UIView.animate(withDuration: 0.8, delay: Double(index) * 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                element.center = positions[index]
                element.alpha = 1.0
                element.transform = CGAffineTransform(rotationAngle: .pi * 2)
            })
        }
        
        // Start continuous floating animation
        startContinuousFloating()
    }
    
    private func startContinuousFloating() {
        for element in floatingElements {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.values = [0, -10, 0, 10, 0]
            animation.duration = 3.0 + Double.random(in: -0.5...0.5)
            animation.repeatCount = .infinity
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            element.layer.add(animation, forKey: "floating")
        }
    }
    
    private func animateTextAndButtons() {
        // Animate title
        UIView.animate(withDuration: 0.6, delay: 0.3, options: [.curveEaseOut], animations: {
            self.titleLabel.alpha = 1.0
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: -10).concatenating(CGAffineTransform(scaleX: 1.05, y: 1.05))
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.titleLabel.transform = .identity
            }
        }
        
        // Animate subtitle
        UIView.animate(withDuration: 0.6, delay: 0.5, options: [.curveEaseOut], animations: {
            self.subtitleLabel.alpha = 1.0
        })
        
        // Animate buttons
        UIView.animate(withDuration: 0.6, delay: 0.7, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: {
            self.trackButton.alpha = 1.0
            self.trackButton.transform = CGAffineTransform(translationX: 0, y: -5)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.trackButton.transform = .identity
            }
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.9, options: [.curveEaseOut], animations: {
            self.backButton.alpha = 1.0
        })
    }
}






