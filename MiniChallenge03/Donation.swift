//
//  Donation.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CloudKit

public class Donation {

    var id: CKRecordID = CKRecordID(recordName: "")
    var date: Date
    var location: String
    
    init(){
        self.date = Date()
        self.location = "Local não informado"
    }
    
    init(date: Date){
        self.date = date
        self.location = "Local não informado"
    }
    
    init(date: Date, location: String){
        self.date = Date()
        self.location = location
    }
    
    init(record: CKRecord){
        self.id = record.recordID
        self.date = record.value(forKey: "date") as! Date
        self.location = record.value(forKey: "location") as! String
    }
    
    func toCKRecord() -> CKRecord {
        let record = CKRecord(recordType: "Donation")
        record.setValue(self.date, forKey: "date")
        record.setValue(self.location, forKey: "location")
        
        return record
    }
}
