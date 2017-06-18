//
//  LoginViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 16/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let juam = User(key: nil, name: "John", email: "john@doe.com", cpf: "00000000000", bt: .abNegative, weight: 100, gender: .male)
        FirebaseConnection.addUser(user: juam, password: "12345678")

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
        //TODO
//        if self.emailField.text != "" && self.passwordField.text != "" {
            FirebaseConnection.signUserIn(email: self.emailField.text!, password: self.passwordField.text!, completion: {user, error in
//                if let _ = error {
//                    //não foi possível logar usuário
//                    self.loginButton.isHidden = false
//                    self.loginButton.isEnabled = true
//                    self.activity.stopAnimating()
//                } else {
                    self.performSegue(withIdentifier: "enter", sender: nil)
                    self.activity.stopAnimating()
//                }
            })
            self.loginButton.isHidden = true
            self.loginButton.isEnabled = false
            self.activity.startAnimating()
//        }
    }
}
