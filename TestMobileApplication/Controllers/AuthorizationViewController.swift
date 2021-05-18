//
//  AuthorizationViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit
import CoreData


class AuthorizationViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var birthDate: UITextField!
    @IBOutlet var polcyNumberTextField: UITextField!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func TextFieldEndMethod(_ sender: UITextField) {
        
        view.endEditing(true)
    }

    @IBAction func registr(_ sender: UIButton) {
        
        let context = delegate.persistentContainer.viewContext
        let alert = UIAlertController(title: "Upss, Error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))

        if loginTextField.hasText, passwordTextField.hasText, repeatTextField.hasText, lastNameTextField.hasText, firstNameTextField.hasText, emailTextField.hasText, phoneNumber.hasText, birthDate.hasText, polcyNumberTextField.hasText{
            
            
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
            fetch.predicate = NSPredicate(format: "login == %@", loginTextField.text!)
            
            let data:[Entity] = try! context.fetch(fetch) as! [Entity]
            
            
            if data.count > 0 {
                alert.message = "This username is already in use "
                self.present(alert, animated: true)
            }else{
                if passwordTextField.text == repeatTextField.text{
                    
                    let newValue = Entity(context: context)
                    
                    newValue.login = loginTextField.text
                    newValue.password = passwordTextField.text
                    newValue.lastName = lastNameTextField.text
                    newValue.firstName = firstNameTextField.text
                    newValue.email = emailTextField.text
                    newValue.phoneNumber = phoneNumber.text
                    newValue.birthDate = birthDate.text
                    newValue.pollicyNumber = polcyNumberTextField.text
                    
                    
                    if ((try? context.save()) != nil){
                        
                        globalProfil = newValue
                        
                        let vc = storyboard?.instantiateViewController(withIdentifier: "mainScreen")
                        self.present(vc!, animated: true)
                        
                    }else{
                        alert.message = "Something went wrong. We couldn't save you"
                        self.present(alert, animated: true)
                    }
                }else{
                    alert.message = "Your passwords don't match"
                    self.present(alert, animated: true)
                }
            }
        }else{
            alert.message = "Please fill in all the text fields"
            self.present(alert, animated: true)
        }

    }


}
