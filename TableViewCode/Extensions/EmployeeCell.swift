//
//  EmployeeCell.swift
//  TableViewCode
//
//  Created by Байсангур on 03.11.2022.
//

import Foundation
import UIKit

class EmployeeCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    let nameEmployee = UILabel()
    let phoneNumber = UILabel()
    let skills = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupConstraints()
    }

// MARK: - setupConstraints()
    
    func setupConstraints() {
        safeArea.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addSubview(nameEmployee)
        addSubview(phoneNumber)
        addSubview(skills)
        nameEmployee.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        skills.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameEmployee.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
            nameEmployee.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumber.leadingAnchor.constraint(equalTo: nameEmployee.leadingAnchor),
            phoneNumber.topAnchor.constraint(equalTo: nameEmployee.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            skills.leadingAnchor.constraint(equalTo: nameEmployee.leadingAnchor),
            skills.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 10)
        ])
    }
}
