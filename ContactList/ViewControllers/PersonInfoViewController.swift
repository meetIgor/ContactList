//
//  PersonInfoViewController.swift
//  ContactList
//
//  Created by igor s on 20.07.2022.
//

import UIKit

class PersonInfoViewController: UIViewController {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullname
        phoneLabel.text = "Phone: " + person.phone
        emailLabel.text = "Email:  " + person.mail
    }
    
}
