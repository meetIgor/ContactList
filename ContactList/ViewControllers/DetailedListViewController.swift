//
//  DetailedListViewController.swift
//  ContactList
//
//  Created by igor s on 20.07.2022.
//

import UIKit

class DetailedListViewController: UITableViewController {
    
    var personsList: [Person]!
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personsList[section].fullname
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
            content.text = personsList[indexPath.section].phone
        } else {
            content.image = UIImage(systemName: "mail")
            content.text = personsList[indexPath.section].mail
        }
        cell.contentConfiguration = content
        return cell
    }
    
}

