//
//  User.swift
//  MiniChallenge03
//
//  Created by Andre Faruolo on 09/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation

public class User {
    
    var name: String
    var email: String
    var cpf: String
    var bt: BloodType?
    var weight: Double?
    var gender: Gender?
    
    
    var lastKnownDonation : Date?
    var isAbleToDonate: Bool?
    
    
    
    public init(){
        self.name = ""
        self.email = ""
        self.cpf = ""
    }
    
    public init(name: String, email: String, cpf: String){
        
        self.name = name
        self.email = email
        self.cpf = cpf
    
    }

}

enum BloodType: String{
    
    case aPositive = "A+"
    case aNegative = "A-"
    case bPositive = "B+"
    case bNegative = "B-"
    case abPositive = "AB+"
    case abNegative = "AB-"
    case oPositive = "O+"
    case oNegative = "O-"
    
}

enum Gender: String{
    
    case male = "Masculino"
    case female = "Feminino"
    
}
