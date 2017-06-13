//
//  Donation.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import Firebase

public class Donation: NSObject {

    var key: String?
    var date: Date
    var location: String
    var ref: FIRDatabaseReference?
    
    init(key:String?, date: Date, location: String){
        
        self.key = key
        self.date = date
        self.location = location
        self.ref = nil
    
        
    }
    
    init(snapshot: FIRDataSnapshot){
        
        let dateFormatter = DateFormatter()
    
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        date = dateFormatter.date(from: snapshotValue["date"] as! String )!
        location = snapshotValue["date"] as! String
        ref = snapshot.ref
        
    }
    
    func toAnyObject() -> Any {
        
        return [
        
            "date": date,
            "location": location
            
        ]
        
    }
    
    
    
}
