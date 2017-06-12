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

    let key: String?
    var date: Date
    var location: String?
    let ref: FIRDatabaseReference?
    
    init(date: Date){
        
        self.key = nil
        self.date = Date()
        self.ref = nil
        
    }
    
    init(snapshot: FIRDataSnapshot){
        
        let dateFormatter = DateFormatter()
    
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        date = dateFormatter.date(from: snapshotValue["date"] as! String )!
        ref = snapshot.ref
        
    }
    
    func toAnyObject() -> Any {
        
        return [
        
            "key": key,
            "date": date
            
            
        ]
        
    }
    
    
    
}
