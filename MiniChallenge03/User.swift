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
    var key: CKRecordID
    var bt: BloodType
    var weight: Double
    var gender: Gender
    var donations: [Donation] = []
    
    init(key:CKRecordID, bt: BloodType, weight: Double, gender: Gender){
        self.key = key
        self.bt = bt
        self.weight = weight
        self.gender = gender
    }
    
    init(record: CKRecord){
        key = record.recordID
        self.bt = BloodType(record.value(forKey: "bloodType") as! Int)!
        self.weight = record.value(forKey: "weight") as! Double
        self.gender = Gender(record.value(forKey: "gender") as! Int)
    }
    
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Users")
        record.setValue(self.bt, forKey: "bloodType")
        record.setValue(self.gender, forKey: "gender")
        record.setValue(self.weight, forKey: "weight")
        
        return record
    }
}
