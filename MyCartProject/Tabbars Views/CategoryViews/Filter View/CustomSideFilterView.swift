//
//  CustomSideFilterView.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class CustomSideFilterView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    public let tableView = UITableView()
    private let menuItems = [
        "Types",
        "Properties"
    ]
    
    var selectedIndex: IndexPath = IndexPath(item: 0, section: 0)

    let verticalLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
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
        backgroundColor = .white
        layer.cornerRadius = 10


        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategorySideMenuCellWithoutImage.self,
                           forCellReuseIdentifier: CategorySideMenuCellWithoutImage.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false

        addSubview(tableView)
        addSubview(verticalLine)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            verticalLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalLine.topAnchor.constraint(equalTo: topAnchor),
            verticalLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalLine.widthAnchor.constraint(equalToConstant: 0.5),
        ])
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategorySideMenuCellWithoutImage.cellIdentifier,
            for: indexPath
        ) as? CategorySideMenuCellWithoutImage else {
            fatalError("Unable to dequeue cell")
        }
        
        cell.menuLabel.text = menuItems[indexPath.row]
        cell.verticalSelection.backgroundColor =
            indexPath == selectedIndex ? .detailView : .white
        cell.menuLabel.textColor = indexPath == selectedIndex ? .detailView : .black
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndex = selectedIndex
        selectedIndex = indexPath

        var indexesToReload = [indexPath]
        if previousIndex != indexPath {
            indexesToReload.append(previousIndex)
        }

        tableView.reloadRows(at: indexesToReload, with: .none)
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
