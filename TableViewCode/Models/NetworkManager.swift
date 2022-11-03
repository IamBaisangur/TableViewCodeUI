//
//  NetworkManager.swift
//  TableViewCode
//
//  Created by Байсангур on 01.11.2022.
//

import Foundation

struct NetworkManager {
    
    func fetchEmployeesList(onCompletion: @escaping ([Employee]) -> ()) {
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, resp, error in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let currentData = try decoder.decode(EmployeesData.self, from: data)
                onCompletion(currentData.company.employees)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
