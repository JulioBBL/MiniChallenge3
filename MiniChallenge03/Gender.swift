//
//  Gender.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 13/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation

enum Gender: String{
    case male = "Masculino"
    case female = "Feminino"
    
    init(_ value: Int) {
        switch value {
        case 0: self = .male
        default: self = .female
        }
    }
}
