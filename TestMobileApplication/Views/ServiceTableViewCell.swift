//
//  ServiceTableViewCell.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet var serviceTitle: UILabel!
    @IBOutlet var serviceDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
