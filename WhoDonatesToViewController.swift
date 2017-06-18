//
//  WhoDonatesToViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 17/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class WhoDonatesToViewController: UIViewController {
    
    var donor: BloodType = .oNegative
    
    @IBOutlet weak var donorsLabel: UILabel!
    
    @IBOutlet weak var oPReceives: UILabel!
    @IBOutlet weak var oNReceives: UILabel!
    @IBOutlet weak var aPReceives: UILabel!
    @IBOutlet weak var aNReceives: UILabel!
    @IBOutlet weak var bPReceives: UILabel!
    @IBOutlet weak var bNReceives: UILabel!
    @IBOutlet weak var abPReceives: UILabel!
    @IBOutlet weak var abNReceives: UILabel!

    @IBOutlet weak var oPDonates: UILabel!
    @IBOutlet weak var oNDonates: UILabel!
    @IBOutlet weak var aPDonates: UILabel!
    @IBOutlet weak var aNDonates: UILabel!
    @IBOutlet weak var bPDonates: UILabel!
    @IBOutlet weak var bNDonates: UILabel!
    @IBOutlet weak var abPDonates: UILabel!
    @IBOutlet weak var abNDonates: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.donorsLabel.text = self.donor.rawValue
        
        switch self.donor {
        case .oNegative:
            self.oPReceives.alpha = 0.3
            self.aPReceives.alpha = 0.3
            self.aNReceives.alpha = 0.3
            self.bPReceives.alpha = 0.3
            self.bNReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
        case .oPositive:
            self.aPReceives.alpha = 0.3
            self.aNReceives.alpha = 0.3
            self.bPReceives.alpha = 0.3
            self.bNReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            self.abNDonates.alpha = 0.3
            
        case .aNegative:
            self.oPReceives.alpha = 0.3
            self.aPReceives.alpha = 0.3
            self.bPReceives.alpha = 0.3
            self.bNReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            self.bPDonates.alpha = 0.3
            
        case .aPositive:
            self.bPReceives.alpha = 0.3
            self.bNReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            self.bPDonates.alpha = 0.3
            self.abNDonates.alpha = 0.3
            
        case .bNegative:
            self.oPReceives.alpha = 0.3
            self.aNReceives.alpha = 0.3
            self.aPReceives.alpha = 0.3
            self.bPReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.aPDonates.alpha = 0.3
            
        case .bPositive:
            self.aNReceives.alpha = 0.3
            self.aPReceives.alpha = 0.3
            self.abPReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.aPDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            self.abNDonates.alpha = 0.3
            
        case .abNegative:
            self.oNReceives.alpha = 0.3
            self.aNReceives.alpha = 0.3
            self.bNReceives.alpha = 0.3
            self.abNReceives.alpha = 0.3
            
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.aPDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.bPDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            
        default:
            self.oNDonates.alpha = 0.3
            self.oPDonates.alpha = 0.3
            self.aNDonates.alpha = 0.3
            self.aPDonates.alpha = 0.3
            self.bNDonates.alpha = 0.3
            self.bPDonates.alpha = 0.3
            self.abNDonates.alpha = 0.3
        }
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
