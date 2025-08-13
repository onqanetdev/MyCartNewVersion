//
//  FilterView.swift
//  MyCartProject
//
//  Created by Onqanet on 13/08/25.
//

import UIKit

class FilterView: UIView , UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // Remove default separators for cleaner look
        return tableView
    }()



    var filteredOptions: [FilterOptionModel] = []
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        fortViewLoading()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fortViewLoading()
    }
    
    

     func fortViewLoading() {
        
        backgroundColor = .systemBackground
        filteredOptions = filterOptions // Initialize filtered data
        setupViews()
        
    }



    private func setupViews() {
        addSubview(searchBar)
        addSubview(tableView)

        // Stack view for buttons at the bottom
        

        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FilterOptionCell.self, forCellReuseIdentifier: FilterOptionCell.reuseIdentifier)

        // Constraints
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), // Adjust for the red bar
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterOptionCell.reuseIdentifier, for: indexPath) as? FilterOptionCell else {
            return UITableViewCell()
        }
        var option = filteredOptions[indexPath.row]
        cell.configure(with: option)
        cell.selectionStyle = .none // Disable default cell selection highlight

        cell.onCheckboxTapped = { [weak self] isSelected in
            guard let self = self else { return }
            // Update the selection state in our data model
            if let indexInOriginal = filterOptions.firstIndex(where: { $0.name == option.name }) {
                filterOptions[indexInOriginal].isSelected = isSelected
            }
            // Update the selection state in the filtered options as well
            if let indexInFiltered = self.filteredOptions.firstIndex(where: { $0.name == option.name }) {
                self.filteredOptions[indexInFiltered].isSelected = isSelected
            }
            
        }
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // Adjust cell height as needed
    }

    // MARK: - UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredOptions = filterOptions
        } else {
            filteredOptions = filterOptions.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss keyboard
    }
}
