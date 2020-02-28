//
//  EmployeeModel.swift
//  EmployeeManagement
//
//  Created by Mayur Kamthe on 28/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import Foundation

struct  EmployeeFeed: Codable {
    let status:String
    let data:[Employee]?
}

struct Employee: Codable {
    let id:String
    let name:String
    let salary:String
    let age:String
    var profileImage:String?
    
    private enum CodingKeys:String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profileImage = "profile_image"
    }
}
