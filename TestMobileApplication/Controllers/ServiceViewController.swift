//
//  ServiceViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit

class ServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    @IBOutlet var backButton: UIButton!
    let serviceData = ServiceModel().getServiceData()
    @IBOutlet var constraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraint.isActive = true
        backButton.isHidden = false
        tableView.tableFooterView = UIView()
        
        if globalProfil != nil{
            backButton.isHidden = true
            constraint.isActive = false
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceTableViewCell
        
        cell.serviceTitle.text = serviceData[indexPath.row].title
        cell.serviceDescription.text = serviceData[indexPath.row].description
        
        return cell
    }

}
