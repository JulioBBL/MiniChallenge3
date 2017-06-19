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
    
    
    static let ref = FIRDatabase.database().reference()
    
    //    static var hemocentros: [Hemocentro] = []
    static var usuarioAtual: User?
    //    var doacoes: [Donation] = []
    //    var usuarios: [User] = []
    
    
    
    private init(){
//        FirebaseConnection.ref.child("hemocentros").observe(.value, with: {snapshot in
//            for hemo in snapshot.children{
//                FirebaseConnection.hemocentros.append(Hemocentro(snapshot: hemo as! FIRDataSnapshot))
//                
//            }
//            print("passou")
//        })
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let uid = user?.uid {
                FirebaseConnection.ref.child("usuarios/\(uid)").observe(.value, with: {snapshot in
                    FirebaseConnection.usuarioAtual = User(snapshot: snapshot)
                })
            } else {
                // No user is signed in.
            }
        }
    }
    
    static func getHemocentros(completion: @escaping (FIRDataSnapshot) -> Void) {
        FirebaseConnection.ref.child("hemocentros").observe(.value, with: {snapshot in
            completion(snapshot)
        })
    }
    
    static func addUser(user: User, password: String){
        FIRAuth.auth()?.createUser(withEmail: user.email, password: password) { (usuario, error) in
            if error != nil{
                print("error adding new user")
                print(error.debugDescription)
            }else{
                if let uid = usuario?.uid{
                        FirebaseConnection.ref.child("usuarios/\(uid)").setValue(user.toAnyObject())
                }else{
                    print("deu erro com os dados do usuario")
                }
            }
        }
    }
    
    static func signUserIn(email:String, password:String, completion: @escaping (FIRUser?, Error?) -> Void){
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                print("error adding new user")
                print(error.debugDescription)
            }else{
                if let uid = user?.uid{
                    FirebaseConnection.ref.child("usuarios/\(uid)").observe(.value, with: {snapshot in
                        let usuario = User(snapshot: snapshot)
                        FirebaseConnection.usuarioAtual = usuario
                        FirebaseConnection.ref.child("usuarios/\(uid)").setValue(usuario.toAnyObject())
                    })
                }
            }
            completion(user, error)
        }
    }
    
    static func logUserOut(){
        try! FIRAuth.auth()!.signOut()
    }
    
    static func saveUser(usuario: User) {
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            let changeRequest = user.profileChangeRequest()
            
            changeRequest.displayName = usuario.name
            changeRequest.commitChanges { error in
                if error != nil {
                    print("error signing user in")
                } else {
                    FirebaseConnection.ref.child("usuarios/\(user.uid)").setValue(usuario.toAnyObject())
                }
            }
        }
    }
    
    static func deleteUser() {
        let user = FIRAuth.auth()?.currentUser
        
        user?.delete { error in
            if error != nil {
                print("error deleting user")
            } else {
                if let uid = user?.uid{
                    FirebaseConnection.ref.child("usuarios/\(uid)").removeValue()
                }
            }
        }
    }
    
}
