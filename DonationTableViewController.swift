//
//  DonationTableViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import UserNotifications

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
        

        
        FirebaseConnection.usuarioAtual(completion: { user in
            self.donations = user.donations

        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
            segue.destination.hidesBottomBarWhenPushed = true
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    //Mark: - My methods
    
    func retrieveInfo() {
        FirebaseConnection.usuarioAtual(completion: { user in
            self.donations = user.donations
        })
    }
    
    func addNewDonation(_ donation: Donation) {
        self.donations.append(donation)
//        self.sortDonations()
        self.tableView.reloadData()
        FirebaseConnection.usuarioAtual(completion: { user in
            let usuario = user
            usuario.donations = self.donations
            FirebaseConnection.saveUser(usuario: usuario)
        })
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let newDonationDate = Calendar(identifier: .gregorian).date(byAdding: .day, value: 90, to: donation.date)
        self.setNotification(title: "NOME DO APP" /*TODO*/,
            subtitle: "Você já pode doar sangue de novo",
            body: "já fazem 3 meses que você doou sangue pela ultima vez, que tal doar novamente?",
            badge: 1, for: newDonationDate!, withIdentifier: "newDonation")
        
        self.setNagNotification(title: "NOME DO APP" /*TODO*/,
            subtitle: "Que tal doar sangue esse final de semana?",
            body: "já faz tempo que você não doa sangue, porque não ir esse final de semana?",
            badge: 1, withIdentifier: "donationReminder1")
        
    }
    
    func setNotification(title: String, subtitle: String, body: String, badge: Int, for date: Date, withIdentifier identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = badge as NSNumber
        
        //        let repeatAction = UNNotificationAction(identifier:"repeat", title:"Repeat",options: [])
        
        //        let changeAction = UNTextInputNotificationAction(identifier: "change", title: "Change Message", options: [])
        
        let category = UNNotificationCategory(identifier: "actionCategory", actions: [] /*[repeatAction, changeAction]*/, intentIdentifiers: [], options: [])
        
        content.categoryIdentifier = "actionCategory"
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var triggerDate = DateComponents()
        triggerDate.year = Calendar(identifier: .gregorian).component(.year, from: date)
        triggerDate.month = Calendar(identifier: .gregorian).component(.month, from: date)
        triggerDate.day = Calendar(identifier: .gregorian).component(.day, from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let requestIdentifier = identifier
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            if let _ = error {
                print("error \"\(String(describing: error))\" occured while trying to schedule a notification with identifier: \(identifier)")
            }
        })
    }
    
    func setNagNotification(title: String, subtitle: String, body: String, badge: Int, withIdentifier identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = badge as NSNumber
        
        //        let repeatAction = UNNotificationAction(identifier:"repeat", title:"Repeat",options: [])
        
        //        let changeAction = UNTextInputNotificationAction(identifier: "change", title: "Change Message", options: [])
        
        let category = UNNotificationCategory(identifier: "actionCategory", actions: [] /*[repeatAction, changeAction]*/, intentIdentifiers: [], options: [])
        
        content.categoryIdentifier = "actionCategory"
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var triggerDate = DateComponents()
        triggerDate.weekday = 5
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let requestIdentifier = identifier
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            if let _ = error {
                print("error \"\(String(describing: error))\" occured while trying to schedule a notification with identifier: \(identifier)")
            }
        })
    }

//    func sortDonations() {
//        let calendar = Calendar(identifier: .gregorian)
//        for i in 1..<self.donations.count {
//            print(i)
//            print("  - \(calendar.compare(self.donations[i-1].date, to: self.donations[i].date, toGranularity: .day).rawValue)")
//            if calendar.compare(self.donations[i-1].date, to: self.donations[i].date, toGranularity: .day) == .orderedDescending {
//                let aux = self.donations[i]
//                self.donations[i] = self.donations[i-1]
//                self.donations[i-1] = aux
//            }
//        }
//    }
}
