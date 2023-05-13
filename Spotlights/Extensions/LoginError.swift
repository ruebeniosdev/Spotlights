//
//  LoginError.swift
//  Spotlights
//
//  Created by Rueben on 15/04/2023.
//

import Foundation

enum LoginError: Error, LocalizedError, Identifiable {
    case emailEmpty
    case invalidInvalid
    case passwordEmpty
    
    var id: Int {
        hashValue
    }
    
    
    var errorDescription: String? {
        switch self {
        case .emailEmpty:
            return "Email cannot be empty!"
        case .invalidInvalid:
            return "Email is not in a correct format"
        case .passwordEmpty:
            return "Password cannot be empty!"
            
        }
    }
}
