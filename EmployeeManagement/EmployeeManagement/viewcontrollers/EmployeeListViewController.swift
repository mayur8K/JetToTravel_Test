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
    var sortedList = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeTableView.accessibilityIdentifier = "identifier_employeeList"
        self.employeeTableView.dataSource = self
        self.employeeTableView.delegate = self
        
        queryService.getDataForEmployees(urlString: EmployeeApiService.url) { (results, error) in
            self.employeeList = results.data!
            self.sortEmployeeNames(list: self.employeeList)
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
    
    func sortEmployeeNames(list:[Employee]) {
      sortedList =  list.sorted(by: { (user1, user2) -> Bool in
               return (user1.name.lowercased(), user1.age) < (user2.name.lowercased(), user2.age)
           })
    }
}

extension EmployeeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sortedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeCell:EmployeeCell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as! EmployeeCell
        let employeeModel = self.sortedList[indexPath.row]
        employeeCell.configure(model: employeeModel)
        return employeeCell
    }
}

extension EmployeeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "employeeDetail") as? EmployeeDetailsViewController
        vc?.employeeDetails = sortedList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            sortedList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
}


