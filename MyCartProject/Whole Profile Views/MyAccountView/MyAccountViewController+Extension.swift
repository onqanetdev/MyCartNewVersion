//
//  MyAccountViewController+Extension.swift
//  MyCartProject
//
//  Created by Onqanet on 17/07/25.
//

import Foundation
import UIKit




extension MyAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountTblVC.cellIdentifier, for: indexPath) as? MyAccountTblVC else {fatalError("Unable deque cell...")}
        cell.cellData = profileCount[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
