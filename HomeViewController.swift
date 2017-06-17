//
//  HomeViewController.swift
//  MiniChallenge03
//
//  Created by Bruno Cruz on 16/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let firstTime = UserDefaults.standard.object(forKey: "already_visited") as? Bool
        
        
        // if == nill, means that its the first time the app has been opened
        if firstTime == nil {
            UserDefaults.standard.set(true, forKey: "already_visited")
            
            performar()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func performar(){
        performSegue(withIdentifier: "teste", sender: self)
        print("deveria performar")
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
