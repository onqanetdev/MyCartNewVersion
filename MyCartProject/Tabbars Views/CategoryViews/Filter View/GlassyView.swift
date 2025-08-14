//
//  GlassyView.swift
//  MyCartProject
//
//  Created by Onqanet on 14/08/25.
//

import UIKit

class GlassyView: UIView {
    
    private let blurView: UIVisualEffectView
    private let vibrancyView: UIVisualEffectView
    
    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blurEffect)
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        let blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: blurEffect)
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .clear
        layer.cornerRadius = 0
        clipsToBounds = true
        
        // Blur layer
        blurView.alpha = 1.0
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Optional soft white overlay
        let lightOverlay = UIView()
        lightOverlay.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        lightOverlay.translatesAutoresizingMaskIntoConstraints = false
        blurView.contentView.addSubview(lightOverlay)
        NSLayoutConstraint.activate([
            lightOverlay.topAnchor.constraint(equalTo: blurView.contentView.topAnchor),
            lightOverlay.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor),
            lightOverlay.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor),
            lightOverlay.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor)
        ])
        
        // Vibrancy layer
        vibrancyView.alpha = 1.0
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        blurView.contentView.addSubview(vibrancyView)
        NSLayoutConstraint.activate([
            vibrancyView.topAnchor.constraint(equalTo: blurView.contentView.topAnchor),
            vibrancyView.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor),
            vibrancyView.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor),
            vibrancyView.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor)
        ])
    }
    
    /// Adds a vibrancy subview (e.g. labels, icons)
    func addVibrantSubview(_ view: UIView) {
        vibrancyView.contentView.addSubview(view)
    }
}






