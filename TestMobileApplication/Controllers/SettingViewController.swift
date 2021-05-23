//
//  SettingViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    let userDefoalts = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func logOutMethod(_ sender: UIButton) {
        globalProfil = nil
        userDefoalts.set(" ", forKey: "password")
        userDefoalts.set(" ", forKey: "login")
    }
    
}
