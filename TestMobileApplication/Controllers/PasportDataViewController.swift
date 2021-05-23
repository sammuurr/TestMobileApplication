//
//  PasportDataViewController.swift
//  TestMobileApplication
//
//  Created by ADMIMN on 22.05.2021.
//

import UIKit

class PasportDataViewController: UIViewController, UITextFieldDelegate{
    

    @IBOutlet var pasportSeriesTextField: UITextField!
    @IBOutlet var codeDevision_1_TextField: UITextField!
    @IBOutlet var codeDevision_2_TextField: UITextField!
    @IBOutlet var lssuedByFromTextField: UITextField!
    @IBOutlet var dateOfIssueDatePicker: UIDatePicker!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (((textField == codeDevision_1_TextField) || (textField == codeDevision_2_TextField) ) && textField.text?.count ?? 0 > 3) {
            textField.text?.removeLast()
        }
        if textField == pasportSeriesTextField && textField.text?.count ?? 0 > 10 {
            textField.text?.removeLast()
        }
    }
    
    @IBAction func reigistrationButton(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext
        
        let alert = UIAlertController(title: "Upss, Error", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        if pasportSeriesTextField.hasText, codeDevision_1_TextField.hasText, codeDevision_2_TextField.hasText, lssuedByFromTextField.hasText{
            if codeDevision_1_TextField.text!.count > 2,codeDevision_2_TextField.text!.count > 2 {
                if pasportSeriesTextField.text!.count > 9{
                    
                    
                    globalProfil?.pasportSeries = pasportSeriesTextField.text
                    globalProfil?.codeDevision_1 = codeDevision_1_TextField.text
                    globalProfil?.codeDevision_2 = codeDevision_2_TextField.text
                    globalProfil?.lssuedByFrom = lssuedByFromTextField.text
                    globalProfil?.dateOfIssue = dateOfIssueDatePicker.date
                    
                    
                    
                    if ((try? context.save()) != nil){
                        
                        
                        let vc = storyboard?.instantiateViewController(withIdentifier: "mainScreen")
                        self.present(vc!, animated: true)
                        
                        
                    }else{
                        alert.message = "Something went wrong. We couldn't save you"
                        self.present(alert, animated: true)
                    }
                }else{
                    alert.message = "The passport number must consist of 10 digits"
                    self.present(alert, animated: true)
                }
            }else{
                alert.message = "The region code must consist of 6 digits"
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
    @IBAction func removeKeyboardMethod(_ sender: UITextField) {
        view.endEditing(true)
    }
    
}
