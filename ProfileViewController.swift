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
        
        FirebaseConnection.usuarioAtual(completion: { user in
            
            self.bloodTypeOutlet.text = user.bt.rawValue
//            self.weightOutlet.text =  "\(user.weight)"
            self.genderOutlet.text = user.gender.rawValue
            if user.donations.count > 0 {
                self.lastDonationOutlet.text = Utils.dateToString((user.donations[(user.donations.count)].date))
            }
//            if (user.isAble)! {
//                self.aptitudeOutlet.text = "apto"
//            } else {
//                self.aptitudeOutlet.text = "inapto"
//            }
            
            
        })
        
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
    
}
