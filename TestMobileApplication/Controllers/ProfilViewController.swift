//
//  ProfilViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit

class ProfilViewController: UIViewController {

    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var telephoneNumberLabel: UILabel!
    @IBOutlet var emailNumberLabel: UILabel!
    @IBOutlet var policyNumberLabel: UILabel!
    @IBOutlet var birthDayLAbel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = "\(globalProfil!.lastName!) \(globalProfil!.firstName!)"
        telephoneNumberLabel.text = globalProfil!.phoneNumber
        emailNumberLabel.text = globalProfil!.email
        policyNumberLabel.text = globalProfil!.pollicyNumber
        birthDayLAbel.text = globalProfil!.birthDate
        
    }

}
