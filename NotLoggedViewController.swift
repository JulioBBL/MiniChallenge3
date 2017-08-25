//
//  NotLoggedViewController.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 25/08/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class NotLoggedViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.layer.cornerRadius = 6.0
        
    }
    
    
    
    
    
    @IBAction func didPressButton(_ sender: Any) {
        
        
        
        
        guard let settingsUrl = URL(string:"App-Prefs:root=CASTLE") else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
        
        
     
    }
    
    
    
    var window: UIWindow?
    
    override func viewWillAppear(_ animated: Bool) {
        if (FileManager.default.ubiquityIdentityToken != nil) {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            print("entrou")
            
        }else{
            print("nao logado")
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("lol")
        //        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
