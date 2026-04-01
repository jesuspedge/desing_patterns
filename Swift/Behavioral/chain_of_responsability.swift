//
//  chain_of_responsability.swift
//
//
//

import Foundation

// Protocol with the common methods
protocol LoginHandler: AnyObject {
    func setNext(handler: any LoginHandler)
    func handle(email: String, password: String) -> Bool
}

// Concrete implementation for a validation.
// Email validation in this case.
final class ValidEmailHandler: LoginHandler {
    private var nextHandler: (any LoginHandler)?

    func setNext(handler: any LoginHandler) {
        nextHandler = handler
    }

    func handle(email: String, password: String) -> Bool {
        let isValid = email.range(
            of: #"^[a-zA-Z0-9.!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"#,
            options: .regularExpression
        ) != nil

        if !isValid { return false }

        return nextHandler?.handle(email: email, password: password) ?? true
    }
}

// Concrete implementation for a validation.
// Min password length validation in this case.
final class ValidMinPasswordLengthHandler: LoginHandler {
    private var nextHandler: (any LoginHandler)?

    func setNext(handler: any LoginHandler) {
        nextHandler = handler
    }

    func handle(email: String, password: String) -> Bool {
        let isValid = password.count >= 6

        if !isValid { return false }

        return nextHandler?.handle(email: email, password: password) ?? true
    }
}

// Concrete implementation for a validation.
// Max password length validation in this case.
final class ValidMaxPasswordLengthHandler: LoginHandler {
    private var nextHandler: (any LoginHandler)?

    func setNext(handler: any LoginHandler) {
        nextHandler = handler
    }

    func handle(email: String, password: String) -> Bool {
        let isValid = password.count <= 20

        if !isValid { return false }

        return nextHandler?.handle(email: email, password: password) ?? true
    }
}

// Demo

// Creating validators handlers
let validEmail = ValidEmailHandler()
let validMinPassword = ValidMinPasswordLengthHandler()
let validMaxPassword = ValidMaxPasswordLengthHandler()

// Creating the chain
validEmail.setNext(handler: validMinPassword)
validMinPassword.setNext(handler: validMaxPassword)

let valid1 = validEmail.handle(email: "test@test.com", password: "26552SDF")
let valid2 = validEmail.handle(email: "testtest.com", password: "26552SDF")
let valid3 = validEmail.handle(email: "test@test.com", password: "26F")
let valid4 = validEmail.handle(email: "test@test.com", password: "26552SDFDSAJFG876DS8F687DS6F8D6FD876F8S768768F")

print("Validation1: \(valid1)")
print("Validation2: \(valid2)")
print("Validation3: \(valid3)")
print("Validation4: \(valid4)")

// Here is the result:

// Validation1: true
// Validation2: false
// Validation3: false
// Validation4: false
