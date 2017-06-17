//
//  Hemocentro.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 07/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CoreLocation
import Firebase

class Hemocentro: NSObject {
    
    var key: String?
    var nome: String
    var estado: String
    var cidade: String
    var bairro: String
    var endereco: String
    var cep: String
    var latitude: String
    var longitude: String
    var telefone: String
    var ref: FIRDatabaseReference?
    
    init(nome: String,
         estado: String,
         cidade: String,
         bairro: String,
         endereco: String,
         cep: String,
         latitude: String,
         longitude: String,
         telefone: String) {
        
        self.key = nil
        self.nome = nome
        self.estado = estado
        self.cidade = cidade
        self.bairro = bairro
        self.endereco = endereco
        self.cep = cep
        self.latitude = latitude
        self.longitude = longitude
        self.telefone = telefone
        self.ref = nil
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        nome = snapshotValue["nome"] as! String
        estado = snapshotValue["estado"] as! String
        cidade = snapshotValue["cidade"] as! String
        bairro = snapshotValue["bairro"] as! String
        endereco = snapshotValue["endereço"] as! String
        cep = snapshotValue["cep"] as! String
        latitude = snapshotValue["latitude"] as! String
        longitude = snapshotValue["longitude"] as! String
        telefone = snapshotValue["telefone"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "nome": nome,
            "estado": estado,
            "cidade": cidade,
            "bairro": bairro,
            "endereço": endereco,
            "cep": cep,
            "latitude": latitude,
            "longitude": longitude,
            "telefone": telefone
        ]
    }
    
    
}
