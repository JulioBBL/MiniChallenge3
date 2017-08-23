//
//  RegisterTableViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 18/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha1: UITextField!
    @IBOutlet weak var senha2: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var tipoSanguineo: UIPickerView!
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var genero: UISegmentedControl!
    
    var bloodPicker = ["Não sei", "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // MARK: - Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.bloodPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.bloodPicker[row]
    }
    

    @IBAction func didPressDoneButton(_ sender: Any) {
//        if nome.text != "" {
//            if (email.text?.contains("@"))! && (email.text?.contains("."))! {
//                if senha1.text == senha2.text {
//                    if peso.text != "" {
//                        if cpf.text != "" {
//                            let temp = User(key: nil, name: nome.text!, email: email.text!, bt: BloodType(tipoSanguineo.selectedRow(inComponent: 0))!, weight: Double(peso.text!)!, gender: Gender(genero.selectedSegmentIndex))
//                            DatabaseConnection.addUser(user: temp, password: senha1.text!)
//                            
//                            DatabaseConnection.signUserIn(email: temp.email, password: senha1.text!, completion: {user, error in
//                                if error == nil{
//                                    self.performSegue(withIdentifier: "segue", sender: self)
//                                }
//                            })
//                            
//                        }
//                    }
//                }
//            }
//        }
    }
}
