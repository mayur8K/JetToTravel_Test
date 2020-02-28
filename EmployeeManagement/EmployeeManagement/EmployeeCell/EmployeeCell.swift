//
//  EmployeeCell.swift
//  EmployeeManagement
//
//  Created by Mayur Kamthe on 28/02/20.
//  Copyright © 2020 Mayur Kamthe. All rights reserved.
//

import Foundation
import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var profileImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model:Employee) {
        self.name?.text = model.name
        DispatchQueue.global().async {
            if let data = try? Data.init(contentsOf: URL(string: EmployeeApiService.imageUrl)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.profileImage?.image = image
                    }
                }
            }
        }
    }
}
