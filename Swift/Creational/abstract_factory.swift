//
//  abstrac_factory.swift
//
//

// Abstract product protocol for chairs
protocol Chair {
    func hasLegs() -> Bool
    func sitOn()
}

// Abstract product protocol for coffee tables
protocol CoffeTable {
    func hasLegs() -> Bool
    func putOn()
}

// Victorian style chair implementation
class VictorianChair: Chair {
    func hasLegs() -> Bool { return true }
    func sitOn() { print("Sitting on \(String(describing: type(of: self)))") }
}

// Modern style chair implementation
class ModernChair: Chair {
    func hasLegs() -> Bool { return false }
    func sitOn() { print("Sitting on \(String(describing: type(of: self)))") }
}

// Victorian style coffee table implementation
class VictorianCoffeTable: CoffeTable {
    func hasLegs() -> Bool { return true }
    func putOn() { print("Putting on \(String(describing: type(of: self)))") }
}

// Modern style coffee table implementation
class ModernCoffeTable: CoffeTable {
    func hasLegs() -> Bool { return false }
    func putOn() { print("Putting on \(String(describing: type(of: self)))") }
}

// Abstract factory protocol for furniture creation
protocol FornitureFactory {
    func createChair() -> Chair
    func createCoffeTable() -> CoffeTable
}

// Factory that creates Victorian style furniture
class VictorianFornitureFactory: FornitureFactory {
    func createChair() -> Chair { return VictorianChair() }
    func createCoffeTable() -> CoffeTable { return VictorianCoffeTable() }
}

// Factory that creates Modern style furniture
class ModernFornitureFactory: FornitureFactory {
    func createChair() -> Chair { return ModernChair() }
    func createCoffeTable() -> CoffeTable { return ModernCoffeTable() }
}

let victorianFactory: FornitureFactory = VictorianFornitureFactory()
let victorianChair = victorianFactory.createChair()
let victorianTable = victorianFactory.createCoffeTable()

print("====Victorian Factory result====")
print("Chair has legs: \(victorianChair.hasLegs())")
victorianChair.sitOn()
print("Table has legs: \(victorianTable.hasLegs())")
victorianTable.putOn()

let modernFactory: FornitureFactory = ModernFornitureFactory()
let modernChair = modernFactory.createChair()
let modernTable = modernFactory.createCoffeTable()

print("====Modern Factory result====")
print("Chair has legs: \(modernChair.hasLegs())")
modernChair.sitOn()
print("Table has legs: \(modernTable.hasLegs())")
modernTable.putOn()

// ====Victorian Factory result====
// Chair has legs: true
// Sitting on VictorianChair
// Table has legs: true
// Putting on VictorianCoffeTable
// ====Modern Factory result====
// Chair has legs: false
// Sitting on ModernChair
// Table has legs: false
// Putting on ModernCoffeTable
