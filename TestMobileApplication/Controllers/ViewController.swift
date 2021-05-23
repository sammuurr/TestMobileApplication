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
    let userDefoalts = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.async { [self] in
            let profil = auth(login: userDefoalts.string(forKey: "login") ?? " ", password: userDefoalts.string(forKey: "password") ?? " ")
            if profil != nil{
                globalProfil = profil!
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "mainScreen")
                self.present(vc!, animated: true)
            }
        }
    }
    
    
    @IBAction func TextFieldEndMethod(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    func auth(login: String, password: String) -> Entity? {
        let context = delegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        fetch.predicate = NSPredicate(format: "(login == %@) && (password == %@)", argumentArray: [login, password])
        
        let data:[Entity] = try! context.fetch(fetch) as! [Entity]
        if data.count == 1 {
            let profil = data[0]
            
            return profil
        }else{
            return nil
        }
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
                
                userDefoalts.set(passwordTextField!.text!, forKey: "password")
                userDefoalts.set(loginTextField!.text!, forKey: "login")
                
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
    
    @IBAction func removeKeyboard(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    

}

