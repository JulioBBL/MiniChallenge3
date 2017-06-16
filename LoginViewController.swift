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
        if self.emailField.text != "" && self.passwordField.text != "" {
            FirebaseConnection.signUserIn(email: self.emailField.text!, password: self.passwordField.text!, completion: {
                self.performSegue(withIdentifier: "enter", sender: nil)
                self.activity.stopAnimating()
            })
            self.loginButton.isHidden = true
            self.loginButton.isEnabled = false
            self.activity.startAnimating()
        }
    }
}
