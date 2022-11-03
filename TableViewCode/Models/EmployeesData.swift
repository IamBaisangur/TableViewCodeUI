//
//  EmployeesData.swift
//  TableViewCode
//
//  Created by Байсангур on 01.11.2022.
//

import Foundation

struct EmployeesData: Decodable {
    let company: Company
}

struct Company: Decodable {
    let name: String
    let employees: [Employee]
}

struct Employee: Decodable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
