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
    @IBOutlet weak var lastDonationOutlet: UILabel!
    @IBOutlet weak var aptitudeOutlet: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FirebaseConnection.usuarioAtual {
            self.bloodTypeOutlet.text = user.bt.rawValue
            self.weightOutlet.text = String(describing: user.weight)
            self.genderOutlet.text = user.gender.rawValue
            self.lastDonationOutlet.text = Utils.dateToString((user.donations[(user.donations.count)].date))
            
            if (user.isAble)! {
                self.aptitudeOutlet.text = "apto"
            } else {
                self.aptitudeOutlet.text = "inapto"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
