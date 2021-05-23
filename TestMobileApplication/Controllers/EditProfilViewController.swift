//
//  EditProfilViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 23.05.2021.
//

import UIKit

class EditProfilViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var telephoneNumberTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    let container = UIApplication.shared.delegate as! AppDelegate
    let userDefoalts = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func editData(_ sender: UIButton) {
        
        if passwordTextField.hasText || telephoneNumberTextField.hasText || emailTextField.hasText{
            
            let context = container.persistentContainer.viewContext
            
            if passwordTextField.hasText{
                globalProfil?.password = passwordTextField!.text!
            }
            if telephoneNumberTextField.hasText {
                globalProfil?.phoneNumber = telephoneNumberTextField!.text!
            }
            if emailTextField.hasText {
                globalProfil?.email = emailTextField!.text!
            }
            
            passwordTextField.text = ""
            telephoneNumberTextField.text = ""
            emailTextField.text = ""
            
            if ((try? context.save()) != nil){
                globalProfil = nil
                userDefoalts.set(" ", forKey: "password")
                userDefoalts.set(" ", forKey: "login")
                self.navigationController?.dismiss(animated: true)
            }else{
                let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive))
                present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "Fill in at least one field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .destructive))
            present(alert, animated: true)
        }
    }
    
    @IBAction func removeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func returnMethod(_ sender: UITextField) {
        view.endEditing(true)
    }
    
}
