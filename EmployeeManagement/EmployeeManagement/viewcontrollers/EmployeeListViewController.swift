//
//  EmployeeListViewController.swift
//  EmployeeManagement
//
//  Created by Mayur Kamthe on 28/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import Foundation
import UIKit

class EmployeeListViewController: UIViewController {
    @IBOutlet weak var employeeTableView:UITableView!
    var employeeList = [Employee]()
    var queryService = EmployeeApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.employeeTableView.dataSource = self
        self.employeeTableView.delegate = self
        
        queryService.getDataForEmployees(urlString: EmployeeApiService.url) { (results, error) in
            self.employeeList = results.data!
            DispatchQueue.main.async {
                self.employeeTableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension EmployeeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeCell:EmployeeCell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as! EmployeeCell
        let employeeModel = self.employeeList[indexPath.row]
        employeeCell.configure(model: employeeModel)
        return employeeCell
    }
}

extension EmployeeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


