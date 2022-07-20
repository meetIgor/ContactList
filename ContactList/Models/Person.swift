//
//  Person.swift
//  ContactList
//
//  Created by igor s on 20.07.2022.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let mail: String
    let phone: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPersonList() -> [Person] {
        let dataSource = DataStore()
        var persons: [Person] = []
        
        var amount = min(
            dataSource.names.count, dataSource.surnames.count,
            dataSource.phones.count, dataSource.mails.count
        )
        
        while amount != 0 {
            persons.append(
                Person(
                    name: dataSource.names.remove(at: Int.random(in: 0..<amount)),
                    surname: dataSource.surnames.remove(at: Int.random(in: 0..<amount)),
                    mail: dataSource.mails.remove(at: Int.random(in: 0..<amount)),
                    phone: dataSource.phones.remove(at: Int.random(in: 0..<amount))
                )
            )
            amount -= 1
        }
        return persons
    }
}
