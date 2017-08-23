//
//  ProfileViewController.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 10/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var bloodTypeOutlet: UILabel!
    @IBOutlet weak var weightOutlet: UILabel!
    @IBOutlet weak var genderOutlet: UILabel!
//    @IBOutlet weak var aptitudeOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var emailOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = DatabaseConnection.sharedInstance.user {
            self.bloodTypeOutlet.text = user.bt.rawValue
            self.weightOutlet.text =  "\(user.weight)"
            self.genderOutlet.text = user.gender.rawValue
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
