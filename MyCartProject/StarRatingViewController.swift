//
//  StarRatingViewController.swift
//  MyCartProject
//
//  Created by Onqanet on 09/07/25.
//

import UIKit

class StarRatingViewController: UIViewController {
    
    let starStackView = UIStackView()
    let totalStars = 5
    let highlightedStars = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStarRatingView()
    }

    func setupStarRatingView() {
        // Configure StackView
        starStackView.axis = .horizontal
        starStackView.alignment = .center
        starStackView.distribution = .fillEqually
        starStackView.spacing = 8
        starStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(starStackView)

        // Constraints
        NSLayoutConstraint.activate([
            starStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            starStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            starStackView.heightAnchor.constraint(equalToConstant: 40),
            starStackView.widthAnchor.constraint(equalToConstant: 200)
        ])

        // Add Stars
        for i in 0..<totalStars {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.tintColor = (i < highlightedStars) ? .systemYellow : .lightGray
            starImageView.image = UIImage(systemName: "star.fill")
            starStackView.addArrangedSubview(starImageView)
        }
    }
}
