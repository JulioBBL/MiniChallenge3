//
//  DonationTableViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class DonationTableViewController: UITableViewController {
    
    var donations: [Donation] = []
    var isDonationsEmpty: Bool {
        if self.donations.count > 0 {
            return false
        } else {
            return true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.retrieveInfo()
        
        self.clearsSelectionOnViewWillAppear = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.donations.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let donationIndex = self.donations.count - indexPath.row
        var cell: UITableViewCell

        if indexPath.row == 0 {
            if self.isDonationsEmpty {
                cell = tableView.dequeueReusableCell(withIdentifier: "emptyList", for: indexPath)
            } else {
                cell = tableView.dequeueReusableCell(withIdentifier: "nextDonation", for: indexPath)
                (cell as! NewDonationTableViewCell).setDate(to: self.donations[self.donations.count - 1].date)
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "doacao", for: indexPath)
            (cell as! DonationTableViewCell).donationDate.text = Utils.dateToString(self.donations[donationIndex].date)
            (cell as! DonationTableViewCell).donationLocale.text = self.donations[donationIndex].location
            (cell as! DonationTableViewCell).donationNumber.text = "\(donationIndex + 1)ª"
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCadastro" {
            (segue.destination as! DonationCreationTableViewController).delegate = self
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //Mark: - My methods
    
    func retrieveInfo() {
        self.donations = FirebaseConnection.usuarioAtual?.donations ?? []
    }
    
    func addNewDonation(_ donation: Donation) {
        self.donations.append(donation)
        self.tableView.reloadData()
        FirebaseConnection.usuarioAtual?.donations = self.donations
        FirebaseConnection.saveUser()
    }

}
