//
//  LoginViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 16/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.navigationController ?? "naum tem")
        
        emailField.delegate = self
        passwordField.delegate = self
        loginButton.layer.cornerRadius = 6.0
        registerButton.layer.cornerRadius = 6.0
        
//        let juaum = User(key: nil, name: "John", email: "10@10.com", cpf: "00000000000", bt: .abNegative, weight: 100, gender: .male)
//        FirebaseConnection.addUser(user: juaum, password: "12345678")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressLoginButton(_ sender: Any) {
//        self.performSegue(withIdentifier: "enter", sender: nil)
        if self.emailField.text != "" && self.passwordField.text != "" {
            FirebaseConnection.signUserIn(email: self.emailField.text!, password: self.passwordField.text!, completion: {user, error in
                if let _ = error {
                    //não foi possível logar usuário
                    self.loginButton.isHidden = false
                    self.loginButton.isEnabled = true
                    self.activity.stopAnimating()
                } else {
                    self.performSegue(withIdentifier: "enter", sender: nil)
                    self.activity.stopAnimating()
                }
            })
            self.loginButton.isHidden = true
            self.loginButton.isEnabled = false
            self.activity.startAnimating()
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
