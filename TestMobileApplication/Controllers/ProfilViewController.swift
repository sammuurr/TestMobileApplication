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
    @IBOutlet var yearLabel: UILabel!
    
    @IBOutlet var pasportSeriesLabel: UILabel!
    @IBOutlet var codeDevisionLabel: UILabel!
    @IBOutlet var IssuedByFromLabel: UILabel!
    @IBOutlet var dateOfIssueLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let age = Calendar.current.dateComponents([.year], from: globalProfil!.birthDate!, to: Date()).year
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        
        fullNameLabel.text = "\(globalProfil!.firstName!) \(globalProfil!.lastName!) \(globalProfil!.middleName!)"
        telephoneNumberLabel.text = globalProfil!.phoneNumber
        emailNumberLabel.text = globalProfil!.email
        policyNumberLabel.text = globalProfil!.pollicyNumber
        birthDayLAbel.text = dateFormatter.string(from: globalProfil!.birthDate!)
        yearLabel.text = "\(age!) years"
        
        pasportSeriesLabel.text = globalProfil!.pasportSeries
        codeDevisionLabel.text = "\(globalProfil!.codeDevision_1!)-\(globalProfil!.codeDevision_2!)"
        IssuedByFromLabel.text = globalProfil!.lssuedByFrom
        dateOfIssueLabel.text = dateFormatter.string(from: globalProfil!.dateOfIssue!)
    }


}
