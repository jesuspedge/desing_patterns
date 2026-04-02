//
//  command.swift
//
//
//

// Protocol with bussiness logic
// the implementations do the work
protocol Reciever {}

// A concrete implementation of reciever
// implements concretes methods
struct Light: Reciever {
    func turnOn() { print("Light on!") }
    
    func turnOff() { print("Light off!") }
}

// Protocol with the execute method
protocol Command {
    var reciever: any Reciever { get }
    
    func execute()
}

// Concrete implementation of command
// Recieves an implmentation of reciever
// and delegates the operation
struct TurnOff: Command {
    let reciever: any Reciever

    init(light: Light) {
        self.reciever = light
    }

    func execute() {
        (reciever as! Light).turnOff()
    }
}

// Concrete implementation of command
// Recieves an implmentation of reciever
// and delegates the operation
struct TurnOn: Command {
    let reciever: any Reciever

    init(light: Light) {
        self.reciever = light
    }

    func execute() {
        (reciever as! Light).turnOn()
    }
}

// Inits and delegate the operations
// to commands.
// For this case we save a logs history
struct Invoker {
    private var history: [String] = []

    mutating func execute(command: any Command) {
        command.execute()
        history.append("Executed \(type(of: command))")
    }

    func getHistory() -> String {
        history.reduce("") { $0 + "\($1)\n" }
    }
}

// Demo

let light = Light()
var invoker = Invoker()

invoker.execute(command: TurnOn(light: light))
invoker.execute(command: TurnOff(light: light))
invoker.execute(command: TurnOn(light: light))

print("\nLogs:")
print(invoker.getHistory())

// Here is the result:

// Light on!
// Light off!
// Light on!
//
// Logs:
// Executed TurnOn
// Executed TurnOff
// Executed TurnOn
