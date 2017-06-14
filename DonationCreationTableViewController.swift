//
//  DonationCreationTableViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 13/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class DonationCreationTableViewController: UITableViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var locale: UITextField!
    
    var delegate: DonationTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

    @IBAction func didPressDoneButton(_ sender: Any) {
        var donation = Donation()
        
        if let temp = locale.text {
            if temp != "" {
                donation = Donation(date: self.datePicker.date, location: self.locale.text!)
            } else {
                donation = Donation(date: self.datePicker.date)
            }
        }
        
        if let _ = self.delegate {
            delegate!.addNewDonation(donation)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
