//
//  Donation.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import Firebase

public class Donation {

    var key: String?
    var date: Date
    var location: String
    let ref: FIRDatabaseReference?
    
    init(){
        self.key = nil
        self.date = Date()
        self.location = "Local não informado"
        self.ref = nil
    }
    
    init(date: Date){
        self.key = nil
        self.date = date
        self.location = "Local não informado"
        self.ref = nil
    }
    
    init(date: Date, location: String){
        self.key = nil
        self.date = Date()
        self.location = location
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot){
//        let dateFormatter = DateFormatter()
    
        self.key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.date = Utils.dateToString(snapshotValue["date"] as! String)
        self.location = snapshotValue["location"] as! String
        self.ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd/MM/yyyy"
        
        return [
        
            "date": formatter.string(from: date),
            "location": location
        ]
    }
}
