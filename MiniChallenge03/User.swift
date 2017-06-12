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
    var bt: BloodType?
    var weight: Double?
    var gender: Gender?
    var donations: [Donation] = []
    let ref: FIRDatabaseReference?
    
    //var lastKnownDonation : Date?
    var isAbleToDonate: Bool?
    
    
    
    public init(){
        self.key = nil
        self.name = ""
        self.email = ""
        self.cpf = ""
        self.ref = nil
        
    }
    
    public init(name: String, email: String, cpf: String){
        
        self.key = nil
        self.name = name
        self.email = email
        self.cpf = cpf
        self.ref = nil
    
    }
    
    init(snapshot: FIRDataSnapshot){
        
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        email = snapshotValue["email"] as! String
        cpf = snapshotValue["cpf"] as! String
        bt = BloodType(rawValue: snapshotValue["bt"] as! String)
        weight = snapshotValue["weight"] as? Double
        gender = Gender(rawValue: snapshotValue["gender"] as! String)
        //donations = snapshotValue["donations"] as! FIRDataSnapshot
        ref = snapshot.ref
        
    }
    
    func toAnyObject() -> Any {
        
        return [
        
            "key": key,
            "name": name,
            "email": email,
            "cpf": cpf,
            "bt": bt,
            "weight": weight,
            "gender": gender
            
        ]
        
    }
    
    public func lastDonation() -> Donation? {
        
        if (donations.count) > 0{
            
            return donations.last!
            
        }
        
        return nil
        
    }
    
    

}

enum BloodType: String{
    
    case aPositive = "A+"
    case aNegative = "A-"
    case bPositive = "B+"
    case bNegative = "B-"
    case abPositive = "AB+"
    case abNegative = "AB-"
    case oPositive = "O+"
    case oNegative = "O-"
    
}

enum Gender: String{
    
    case male = "Masculino"
    case female = "Feminino"
    
}
