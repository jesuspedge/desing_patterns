//
//  mediator.swift
//
//

// Comun protocol to create mediators
protocol Mediator {
    func notify(sender: any Component, event: String)
}

// Concrete mediator for dialog
// It handles all required verifications
struct DialogMediator: Mediator {
    func notify(sender: any Component, event: String) {
        // Handle verifications here
        switch sender {
            
        case is Button:
            print("\(type(of: sender)) on \(event)")
            
        case is TextBox:
            print("\(type(of: sender)) on \(event)")
            
        case is CheckBox:
            print("\(type(of: sender)) on \(event)")
            
        default:
            break
        }
    }
}

// Protocol to define components and set
// its mediator.
protocol Component {
    var mediator: (any Mediator)? { get set }

    mutating func setMediator(mediator: any Mediator)

    mutating func click()
}

// Concrete implmentation of button component
struct Button: Component {
    var mediator: (any Mediator)?

    mutating func setMediator(mediator: any Mediator) {
        self.mediator = mediator
    }

    mutating func click() {
        mediator?.notify(sender: self, event: "Button Click")
    }
}

// Concrete implmentation of textbox component
struct TextBox: Component {
    var mediator: (any Mediator)?

    mutating func setMediator(mediator: any Mediator) {
        self.mediator = mediator
    }

    mutating func click() {
        mediator?.notify(sender: self, event: "TextBox Click")
    }
}

// Concrete implmentation of checkbox component
struct CheckBox: Component {
    var mediator: (any Mediator)?

    mutating func setMediator(mediator: any Mediator) {
        self.mediator = mediator
    }

    mutating func click() {
        mediator?.notify(sender: self, event: "CheckBox Click")
    }
}

// Demo

let mediator = DialogMediator()
var button = Button()
var textBox = TextBox()
var checkBox = CheckBox()

button.setMediator(mediator: mediator)
textBox.setMediator(mediator: mediator)
checkBox.setMediator(mediator: mediator)

button.click()
textBox.click()
checkBox.click()

// Here is the result:

// Button on Button Click
// TextBox on TextBox Click
// CheckBox on CheckBox Click
