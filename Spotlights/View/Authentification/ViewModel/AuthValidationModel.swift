//
//  AuthValidationModel.swift
//  Spotlights
//
//  Created by Rueben on 05/05/2023.
//
import Combine
import Foundation

extension AuthViewModel {
    // Email validation with regular expression
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    // Password validation with regular expression
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    // Username validation with regular expression
    func isValidUsername(username: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9_-]{3,16}$"
        return NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: username)
    }
    // Full name validation with regular expression
       func isValidFullName(fullName: String) -> Bool {
           let fullNameRegex = "^[\\p{L}'\\-\\.]+( [\\p{L}'\\-\\.]+)+$"
           return NSPredicate(format: "SELF MATCHES %@", fullNameRegex).evaluate(with: fullName)
       }
}
