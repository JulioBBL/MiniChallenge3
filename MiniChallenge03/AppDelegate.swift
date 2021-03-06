//
//  AppDelegate.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 02/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarItemAppearence = UITabBar.appearance()
        
        if let alredyLogged = UserDefaults.standard.value(forKey: "alreadyLogged"){
        // se ja deu as informacoes restantes
            print(alredyLogged)
            
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return true
        
            
        }
        
        if (FileManager.default.ubiquityIdentityToken == nil) {
            let vc = UIStoryboard.init(name: "notLogged", bundle: nil).instantiateViewController(withIdentifier: "tela")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return true
        }
        
       
        tabBarItemAppearence.unselectedItemTintColor = UIColor(red: 72/255.0, green: 156/255.0, blue: 174/255.0, alpha: 1.0)
        

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        if !UserDefaults.standard.bool(forKey: "already") {
            UserDefaults.standard.set(true, forKey: "already")
            
            // vc pra primeira vez somente
            let vc = UIStoryboard.init(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "tutorial")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return true
        }
        
        // vc pra sempre
        let vc = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Main")
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true

    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
