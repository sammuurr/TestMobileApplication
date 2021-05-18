//
//  ViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 18.05.2021.
//

import UIKit
import CoreData

var globalProfil: Entity? = nil

class ViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func TextFieldEndMethod(_ sender: UITextField) {
        
        view.endEditing(true)
    }
    
    
    @IBAction func loginTapMethod(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Upss, Error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        if loginTextField.hasText, passwordTextField.hasText{
            
            let context = delegate.persistentContainer.viewContext
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
            fetch.predicate = NSPredicate(format: "(login == %@) && (password == %@)", argumentArray: [loginTextField!.text!, passwordTextField!.text!])
            
            let data:[Entity] = try! context.fetch(fetch) as! [Entity]
            
            
            if data.count == 1 {
                globalProfil = data[0]
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "mainScreen")
                self.present(vc!, animated: true)
            }else{
                alert.message = "Your username or password is incorrect"
                self.present(alert, animated: true)
            }
        }else{
            alert.message = "Please fill in all the text fields"
            self.present(alert, animated: true)
        }
        
    }
    
    

}

