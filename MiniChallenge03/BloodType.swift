//
//  BloodType.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 13/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation

enum BloodType: String{
    case doesNotKnow = "Não sei"
    case aPositive = "A+"
    case aNegative = "A-"
    case bPositive = "B+"
    case bNegative = "B-"
    case abPositive = "AB+"
    case abNegative = "AB-"
    case oPositive = "O+"
    case oNegative = "O-"
    
    init?(_ value: Int) {
        switch value {
        case 0: self = .doesNotKnow
        case 1: self = .aPositive
        case 2: self = .aNegative
        case 3: self = .bPositive
        case 4: self = .bNegative
        case 5: self = .abPositive
        case 6: self = .abNegative
        case 7: self = .oPositive
        default : self = .oNegative
        }
    }
}
