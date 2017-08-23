//
//  Hemocentro.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 07/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CoreLocation
import CloudKit

class Hemocentro: NSObject {
    
    var id: CKRecordID
    var nome: String
    var estado: String
    var cidade: String
    var bairro: String
    var endereco: String
    var cep: String
    var latitude: String
    var longitude: String
    var telefone: String
    
    init(nome: String,
         estado: String,
         cidade: String,
         bairro: String,
         endereco: String,
         cep: String,
         latitude: String,
         longitude: String,
         telefone: String) {
        
        self.id = CKRecordID(recordName: "")
        self.nome = nome
        self.estado = estado
        self.cidade = cidade
        self.bairro = bairro
        self.endereco = endereco
        self.cep = cep
        self.latitude = latitude
        self.longitude = longitude
        self.telefone = telefone
    }
    
    init(record: CKRecord) {
        id = record.recordID
        self.nome = record.value(forKey: "nome") as! String
        self.estado = record.value(forKey: "estado") as! String
        self.cidade = record.value(forKey: "cidade") as! String
        self.bairro = record.value(forKey: "bairro") as! String
        self.endereco = record.value(forKey: "endereco") as! String
        self.cep = record.value(forKey: "cep") as! String
        self.latitude = record.value(forKey: "latitude") as! String
        self.longitude = record.value(forKey: "longitude") as! String
        self.telefone = record.value(forKey: "telefone") as! String
    }
}
