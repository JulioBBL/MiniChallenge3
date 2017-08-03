//
//  LoginViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 16/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var pickerGenre: UIPickerView!
    @IBOutlet weak var pickerBlood: UIPickerView!
    
    var activeField: UITextField?
    
    var bloodPicker = ["Não sei", "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    
    var genrePicker = ["Masculino", "Feminino"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.navigationController ?? "naum tem")
        
        self.pickerBlood.delegate = self
        self.pickerGenre.delegate = self
        
        
        loginButton.layer.cornerRadius = 6.0
        registerForKeyboardNotifications()

        
        //        let juaum = User(key: nil, name: "John", email: "10@10.com", cpf: "00000000000", bt: .abNegative, weight: 100, gender: .male)
//        FirebaseConnection.addUser(user: juaum, password: "12345678")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
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


    @IBAction func didPressLoginButton(_ sender: Any) {

   //     if self.emailField.text != "" && self.passwordField.text != "" {
    //        FirebaseConnection.signUserIn(email: self.emailField.text!, password: self.passwordField.text!, completion: {user, error in
//                if let _ = error {
//                    //não foi possível logar usuário
//                    self.loginButton.isHidden = false
//                    self.loginButton.isEnabled = true
//                    self.activity.stopAnimating()
//                } else {
//                    self.performSegue(withIdentifier: "enter", sender: nil)
//                    self.activity.stopAnimating()
//                }
//            })
//            self.loginButton.isHidden = true
//            self.loginButton.isEnabled = false
//            self.activity.startAnimating()
//        }
    }
    
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
 
    

}
