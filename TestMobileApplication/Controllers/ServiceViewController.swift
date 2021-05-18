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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        if globalProfil != nil{
            backButton.isHidden = true
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceTableViewCell
        
        cell.serviceTitle.text = serviceData[indexPath.row].title.replacingOccurrences(of: "\n", with: "")
        cell.serviceDescription.text = serviceData[indexPath.row].description.replacingOccurrences(of: "\n", with: "")
        
        return cell
    }

}
