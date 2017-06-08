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
    
    var titulo: String
    var subTitulo: String
    var location: CLLocation
    var rua: String
    var numero: Int
    
    init(titulo: String, subTitulo: String, location: CLLocation, rua: String, numero: Int) {
        
        self.titulo = titulo
        self.subTitulo = subTitulo
        self.location = location
        self.rua = rua
        self.numero = numero
        
    }
    
    
}
