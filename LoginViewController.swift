//
//  LoginViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 16/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import CloudKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var wheightTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pickerGenre: UIPickerView!
    
    @IBOutlet weak var pickerBlood: UIPickerView!
    var bloodChosen: String = "Não sei"
    var genderChosen: String = "Masculino"
    
    
    var bloodPicker = ["Não sei", "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    
    var genrePicker = ["Masculino", "Feminino"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wheightTextField.text = ""
        self.pickerBlood.delegate = self
        self.pickerGenre.delegate = self
        self.wheightTextField.delegate = self
        self.loginButton.layer.cornerRadius = 6.0
        
        
        loginButton.layer.cornerRadius = 6.0
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0:
            return self.bloodPicker.count
        case 1:
            return genrePicker.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 0:
            return self.bloodPicker[row]
        case 1:
            return self.genrePicker[row]
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            bloodChosen = bloodPicker[row]
        case 1:
            genderChosen = genrePicker[row]
        default:
            break
        }
    }
    
    
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        
        if let wheight =  Double(wheightTextField.text!) {
            
            let attributedString = NSAttributedString(string: "Criando conta\n\n", attributes: [
                NSFontAttributeName : UIFont.systemFont(ofSize: 15),
                NSForegroundColorAttributeName : UIColor.black
                ])
            
            let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
            alert.setValue(attributedString, forKey: "attributedTitle")
            let indicator = UIActivityIndicatorView(frame: CGRect(x: alert.view.center.x - 50, y: 60 , width: 40, height: 40))
            indicator.activityIndicatorViewStyle = .gray
            indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            alert.view.addSubview(indicator)
            indicator.startAnimating()
            self.present(alert, animated: true, completion: nil)
            
            
            let u = User.init(bt: BloodType(rawValue: bloodChosen)!, weight: wheight, gender: Gender(rawValue: genderChosen)!)
            DatabaseConnection.sharedInstance.save(user: u) { (error) in
                print(error)
                if error == nil {
                    DispatchQueue.main.async {
                        
                        
                        UserDefaults.standard.set(true, forKey: "alreadyLogged")
                        
                        alert.dismiss(animated: true, completion: {
                            self.performSegue(withIdentifier: "toMain", sender: self)
                        })
                        
                        
                    }
                }
            }
            
        }else{
            //MARK: Chamar alert "peso invalido"
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
}
