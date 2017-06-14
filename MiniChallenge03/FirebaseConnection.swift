//
//  FirebaseConnection.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import Firebase

class FirebaseConnection {
    static let sharedInstance = FirebaseConnection()
    
    
    var ref = FIRDatabase.database().reference()
    
    static var hemocentros: [Hemocentro] = []
    static var usuarioAtual: User?
//    var doacoes: [Donation] = []
//    var usuarios: [User] = []
    
    
    
    private init(){
        ref.child("hemocetros").observe(.childAdded, with: {snapshot in
            FirebaseConnection.hemocentros.append(Hemocentro(snapshot: snapshot))
        })
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if user != nil {
                self.ref.child((user?.uid)!).observe(.childAdded, with: {snapshot in
                    
                })
            } else {
                // No user is signed in.
            }
        }
    }
    
    
}
