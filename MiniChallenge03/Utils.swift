//
//  Utils.swift
//  MackPool
//
//  Created by Julio Brazil on 03/05/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import Foundation
import CoreLocation

public class Utils {
    public static func dateToString(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        if let date = dateFormatter.date(from: string) {
            return date
        } else {
            return Date()
        }
    }
    
    public static func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.string(from: date)
    }
    
    public static func stringToCLLocation(_ string: String) -> CLLocation {
        let tmp = string.components(separatedBy: "/")
        let location = CLLocation(latitude: Double(tmp[0]) ?? 0, longitude: Double(tmp[1]) ?? 0)
        return location
    }
}
