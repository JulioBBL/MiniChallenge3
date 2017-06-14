//
//  User.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 09/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import Firebase

public class User {
    
    var key: String?
    var name: String
    var email: String
    var cpf: String
    var bt: BloodType
    var weight: Double
    var gender: Gender
    var donations: [Donation] = []
    var isAble: Bool?
    let ref: FIRDatabaseReference?
    
    
    
    
    init(key:String?, name: String, email: String, cpf: String, bt: BloodType, weight: Double, gender: Gender){
        
        self.key = key
        self.name = name
        self.email = email
        self.cpf = cpf
        self.bt = bt
        self.weight = weight
        self.gender = gender
        self.ref = nil
        
    }
    
    init(snapshot: FIRDataSnapshot){
        
        let formatter = DateFormatter()
        
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        cpf = snapshotValue["cpf"] as! String
        bt = BloodType(rawValue: snapshotValue["bt"] as! String)!
        weight = (snapshotValue["weight"] as? Double)!
        gender = Gender(rawValue: snapshotValue["gender"] as! String)!
        for snap in snapshot.children{
            let snapValue = (snap as! FIRDataSnapshot).value as! [String: AnyObject]
            
            let temp = Donation(date: formatter.date(from: snapValue["date"] as! String)!, location: snapValue["location"] as! String)
            temp.key = ((snap as! FIRDataSnapshot).key)
            donations.append(temp)
        }
        ref = snapshot.ref
        
    }
    
    func toAnyObject() -> Any {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd/MM/yyyy"
        
        
        var doacoes: [String:[String:String]] = [:]
        
        var i = 0
        for donation in donations{
            doacoes[String(i)] = [
                "date":formatter.string(from: donation.date),
                "location":donation.location
            ]
            i += 1
        }
        
        return [
            
            "name": name,
            "email": email,
            "cpf": cpf,
            "bt": bt,
            "weight": weight,
            "gender": gender,
            "donations": [doacoes]
            
        ]
        
    }
    
    
    
}




