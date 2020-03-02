//
//  EmployeeDetailsViewController.swift
//  EmployeeManagement
//
//  Created by Mayur Kamthe on 01/03/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import Foundation
import UIKit

class EmployeeDetailsViewController: UIViewController {
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeAge: UILabel!
    @IBOutlet weak var employeeSalary: UILabel!
    
    var employeeDetails:Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        employeeName.text = employeeDetails?.name
        employeeAge.text = employeeDetails?.age
        employeeSalary.text = employeeDetails?.salary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
