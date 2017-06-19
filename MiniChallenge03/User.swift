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
        
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        cpf = snapshotValue["cpf"] as! String
        bt = BloodType(rawValue: snapshotValue["bt"] as! String)!
        weight = snapshotValue["weight"] as! Double
        gender = Gender(rawValue: snapshotValue["gender"] as! String)!
        
        var tempDon: [Donation] = []
        for snap in snapshot.childSnapshot(forPath: "donations").children{
            tempDon.append(Donation(snapshot: snap as! FIRDataSnapshot))
        }
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        
        
        var doacoes: [String: Any] = [:]
        
        var i = 0
        for donation in donations{
            doacoes[String(i)] = donation.toAnyObject()
            i += 1
        }
        
        
        
        return [
            "name": name,
            "email": email,
            "cpf": cpf,
            "bt": bt.rawValue,
            "weight": weight,
            "gender": gender.rawValue,
            "donations": doacoes
        ]
    }
}
