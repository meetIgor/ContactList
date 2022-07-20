//
//  ContactListViewController.swift
//  ContactList
//
//  Created by igor s on 20.07.2022.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    let personsList = Person.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBarController?.delegate = self
        
        guard let tableViews = tabBarController?.viewControllers else { return }
        guard let detailedList = tableViews.last as? DetailedListViewController else { return }
        detailedList.personsList = personsList
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = personsList[indexPath.row].fullname
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personInfoVC = segue.destination as? PersonInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        personInfoVC.person = personsList[indexPath.row]
    }

}

//extension ContactListViewController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        guard let detailedList = tabBarController.viewControllers?.last as? DetailedListViewController else { return false }
//        detailedList.personList = personList
//        return true
//    }
//
//}
