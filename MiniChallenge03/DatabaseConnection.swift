//
//  FirebaseConnection.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CloudKit

class DatabaseConnection {
    static let sharedInstance = DatabaseConnection()
    
    var user: User?
    let container: CKContainer
    let publicDB: CKDatabase
    let privateDB: CKDatabase
    
    private init() {
        self.container = CKContainer.default()
        self.publicDB = container.publicCloudDatabase
        self.privateDB = container.privateCloudDatabase
        
        self.user = nil
    }
    
    func usuarioAtual(completion: @escaping (User, Error?) -> Void) {
        if let user = self.user {
            completion(user, nil)
        } else {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "UserExtra", predicate: predicate)
            
            self.privateDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                if let record = records?.first {
                    self.user = User(record: record)
                    completion(self.user!, error)
                }
            })
        }
    }
    
    func getHemocentros(completion: @escaping ([Hemocentro]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Hemocentro", predicate: predicate)
        
        self.publicDB.perform(query, inZoneWith: nil) { (records, error) in
            if error != nil && records != nil && (records?.count)! > 0 {
                var hemocentros: [Hemocentro] = []
                for record in records! {
                    hemocentros.append(Hemocentro(record: record))
                }
                completion(hemocentros)
            }
        }
    }
    
    func getDonations(completion: @escaping ([Donation]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Donation", predicate: predicate)
        
        self.privateDB.perform(query, inZoneWith: nil) { (records, error) in
            var doacoes: [Donation] = []
            
            if error == nil  && records != nil && (records?.count)! > 0 {
                for record in records! {
                    doacoes.append(Donation(record: record))
                }
            }
            completion(doacoes)
        }
    }
    
    func save(donation record: Donation, completion: @escaping (Error?) -> Void) {
        self.privateDB.save(record.toCKRecord()) { (record, error) in
            print("foi fião")
            completion(error)
        }
    }
    
    func save(user: User, completion: @escaping (Error?) -> Void) {
        self.privateDB.save(user.toCKRecord()) { (record, error) in
            print("foi o cracudo")
            completion(error)
        }
    }
}
