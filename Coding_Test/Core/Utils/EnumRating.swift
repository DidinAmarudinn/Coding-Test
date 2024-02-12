//
//  EnumRating.swift
//  Coding_Test
//
//  Created by didin amarudin on 12/02/24.
//

import Foundation

enum Rating: Int {
    case normal = 1
    case verygood = 2
    case awesome = 3
    
    var label: String {
        switch self {
        case .normal:
           return "Normal"
        case .verygood:
            return "Very Good"
        case .awesome:
            return "Awesome"
        }
    }
}
