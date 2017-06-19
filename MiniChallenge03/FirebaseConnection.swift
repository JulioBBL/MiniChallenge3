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
    
    static var user: User?
    static let ref = FIRDatabase.database().reference()
    
    //    static var hemocentros: [Hemocentro] = []
    //    static var usuarioAtual: User?{
    //        get{
    //            return self.getCurrentUserInfo()
    //        }
    //    }
    //    var doacoes: [Donation] = []
    //    var usuarios: [User] = []
    
    //    static func process(completion: @escaping() -> Void) -> User{
    //        let user = FIRAuth.auth()?.currentUser
    //        let usuario: User?
    //        if let uid = user?.uid {
    //            FirebaseConnection.ref.child("usuarios/\(uid)").observe(.value, with: {snapshot in
    //
    //            })
    //        } else {
    //            // No user is signed in.
    //        }
    //    }
    
    
    //        FIRAuth.auth()?.currentUser
    
    //    static func assyncFunc(completion: @escaping (String) -> User) -> User{
    //
    //
    //        return
    //    }
    //
    //    static func getCurrentUserInfo() -> User{
    //        let user = FIRAuth.auth()?.currentUser
    //        if let uid = user?.uid{
    //            return assyncFunc(completion: { uid in
    //                    FirebaseConnection.ref.child("usuarios/\(uid)").observe(.value, with: {snapshot in
    //                        return User(snapshot: snapshot)
    //                    })
    //            })
    //        }
    //    }
    
    static func usuarioAtual(completion: @escaping (User) -> Void) {
        let user = FIRAuth.auth()?.currentUser
        if let uid = user?.uid{
            FirebaseConnection.ref.child("usuarios/\(uid)").observeSingleEvent(of: .value, with: {snapshot in
                completion(User(snapshot: snapshot))
            })
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
                print("error login as \(email)")
                print(error.debugDescription)
            }else{
                //                if let uid = user?.uid{
                //                    FirebaseConnection.ref.child("usuarios/\(uid)").observe(.value, with: {snapshot in
                //                        let usuario = User(snapshot: snapshot)
                //                        FirebaseConnection.usuarioAtual = usuario
                //                    })
                //                }
            }
            completion(user, error)
        }
    }
    
    static func logUserOut(){
        try! FIRAuth.auth()!.signOut()
    }
    
    static func saveUser(usuario: User, completion: @escaping () -> Void) {
        let user = FIRAuth.auth()?.currentUser
        if let uid = user?.uid{
            FirebaseConnection.ref.child("usuarios/\(uid)").setValue(usuario.toAnyObject())
        }
        completion()
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
