//
//  strategy.swift
//
//
//

// Protocol to defines the methods of each strategy
protocol Strategy {
    func execute(a: Double, b: Double) -> Double
}

// Concrete implementation with it owns strategy
struct AddStrategy: Strategy {
    func execute(a: Double, b: Double) -> Double { a + b }
}

// Concrete implementation with it owns strategy
struct SubstracStrategy: Strategy {
    func execute(a: Double, b: Double) -> Double { a - b }
}

// Concrete implementation with it owns strategy
struct MultiplyStrategy: Strategy {
    func execute(a: Double, b: Double) -> Double { a * b }
}

// Executes actions depending on provided strategy
struct Context {
    private var _strategy: Strategy?

    mutating func setStrategy(strategy: Strategy) { _strategy = strategy }

    func executeStrategy(a: Double, b: Double) -> Double {
        _strategy?.execute(a: a, b: b) ?? 0
    }
}

// Demo

var context = Context()

let addStrategy = AddStrategy()
let substractStrategy = SubstracStrategy()
let multiplyStrategy = MultiplyStrategy()

let a = 4.0
let b = 10.0

print("Number a value: \(Int(a))  Number b value: \(Int(b))\n")

context.setStrategy(strategy: addStrategy)
print("Add strategy result: \(context.executeStrategy(a: a, b: b))")

context.setStrategy(strategy: substractStrategy)
print("Substract strategy result: \(context.executeStrategy(a: a, b: b))")

context.setStrategy(strategy: multiplyStrategy)
print("Multiply strategy result: \(context.executeStrategy(a: a, b: b))")

// Here is the result:

// Number a value: 4  Number b value: 10

// Add strategy result: 14.0
// Substract strategy result: -6.0
// Multiply strategy result: 40.0
