//
//  EmployeesListVC.swift
//  TableViewCode
//
//  Created by Байсангур on 01.11.2022.
//

import UIKit

final class EmployeesListVC: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var employees = [Employee]()
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "cellid")
        setupView()
        
        let anonymousFunction = { (fetchedEmployeesList: [Employee]) in
            DispatchQueue.main.async {
                self.employees = fetchedEmployeesList
                self.tableView.reloadData()
            }
        }
        networkManager.fetchEmployeesList(onCompletion: anonymousFunction)
    }
    
    
// MARK: - Setup View
    
    func setupView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension EmployeesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        guard let employeeCell = cell as? EmployeeCell else {
            return cell
        }
        
        let employee = employees.sorted(by: {$0.name < $1.name})[indexPath.row]
        employeeCell.nameEmployee.text = "Name employee: \(employee.name)"
        employeeCell.phoneNumber.text = "Phone number: \(employee.phoneNumber)"
        employeeCell.skills.text = "Skills: \(employee.skills.joined(separator: ", "))"
        return cell
    }
}
