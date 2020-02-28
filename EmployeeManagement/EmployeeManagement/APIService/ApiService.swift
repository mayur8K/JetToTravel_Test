//
//  ApiService.swift
//  EmployeeManagement
//
//  Created by Mayur Kamthe on 28/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import Foundation

class EmployeeApiService {
    static let url = "http://dummy.restapiexample.com/api/v1/employees"
    static let imageUrl = "http://static.tvmaze.com/uploads/images/medium_portrait/214/537337.jpg"
    typealias queryResult = (EmployeeFeed, String) -> Void
    let defaultSession = URLSession(configuration: .default)
    var dataTaskObj:URLSessionDataTask?

    func getDataForEmployees(urlString: String , completion: @escaping queryResult) {
       
        dataTaskObj?.cancel()
       
        dataTaskObj = defaultSession.dataTask(with: URL(string: urlString)!, completionHandler: { data, response, error in
           
        defer {self.dataTaskObj = nil}
       
        if let error = error {
            print("error \(error)")
        } else {
            if let response = response as? HTTPURLResponse {
                print("statusCode: \(response.statusCode)")
            }
        }
        
        if let data = data {
            do {
                let serverResponse = try JSONDecoder().decode(EmployeeFeed.self, from: data)
                completion(serverResponse, "Employee list is empty")
            } catch {
                print("Unexpected error: \(error)")
            }
        }
        })
        dataTaskObj?.resume()
    }
}
