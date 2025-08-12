//
//  CustomSideMenuView.swift
//  MyCartProject
//
//  Created by Onqanet on 07/08/25.
//

import UIKit

class CustomSideMenuView:  UIView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    public let tableView = UITableView()
    private let menuItems = ["Chips & Wafers", "Bhujia & Mixtures", "Namkeen Snacks", "Nachos", "Healthy Snacks", "Popcorn", "Papad & Fryums", "Premium"]
    
    
    var selectedIndex: IndexPath = IndexPath(item: 0, section: 0)

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }

    // MARK: - Setup
    private func setupView() {
        backgroundColor = .white // Set background color for the side menu itself
        layer.cornerRadius = 10 // Rounded corners for the side menu
        layer.shadowColor = UIColor.purple.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 5

        // Configure the table view
        tableView.dataSource = self
        tableView.delegate = self
        
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
        tableView.register(CategorySideMenuCell.self, forCellReuseIdentifier: CategorySideMenuCell.cellIdentifier)
        tableView.separatorStyle = .none // No separators between cells
        tableView.backgroundColor = .clear // Make table view background clear to show parent view's background
        tableView.showsVerticalScrollIndicator = false

        // Add table view to the side menu view
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Set up constraints for the table view to fill the CustomSideMenuView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0), // Padding from top
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0), // Padding from left
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0), // Padding from right
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0) // Padding from bottom
        ])
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySideMenuCell.cellIdentifier, for: indexPath) as? CategorySideMenuCell else {fatalError("Unable deque cell...")}
        
        cell.menuLabel.text = menuItems[indexPath.row]
        cell.menuImageView.image = UIImage(named: "Crax") // Replace with actual asset names
        
        
        if indexPath == selectedIndex {
            cell.verticalSelection.backgroundColor = .detailView
        } else {
            cell.verticalSelection.backgroundColor = .white
        }
        
        
        return cell
        
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Selected: \(menuItems[indexPath.row])")
        // You can add logic here to handle menu item selection, e.g., notify a delegate
        
        let previousIndex = selectedIndex
            selectedIndex = indexPath

            var indexesToReload = [indexPath]
            if previousIndex != indexPath {
                indexesToReload.append(previousIndex)
            }

        //tableView.reloadR(at: indexesToReload)
        tableView.reloadRows(at: indexesToReload, with: .none)
        
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Height for each row
    }
}









