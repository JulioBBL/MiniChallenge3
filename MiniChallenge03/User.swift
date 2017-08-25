//
//  User.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 09/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CloudKit

public class User {
    var bt: BloodType
    var weight: Double
    var gender: Gender
    var donations: [Donation] = []
    
    init(bt: BloodType, weight: Double, gender: Gender){
        self.bt = bt
        self.weight = weight
        self.gender = gender
    }
    
    init(record: CKRecord){
        self.bt = BloodType(rawValue: record.value(forKey: "bloodType") as! String)!
        self.weight = record.value(forKey: "weight") as! Double
        self.gender = Gender(rawValue: record.value(forKey: "gender") as! String)!
    }
    
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "UserExtra")
        record.setValue(self.bt.rawValue, forKey: "bloodType")
        record.setValue(self.gender.rawValue, forKey: "gender")
        record.setValue(self.weight, forKey: "weight")
        
        return record
    }
}
