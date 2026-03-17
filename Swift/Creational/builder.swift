//
//  builder.swift
//
//

// Enum to define the pizza sizes
enum PizzaSize { case small, medium, large }

// Enum to define all pizza toppings
enum Toppings { case mozzarella, groundBeef, pepperoni, olives, mushrooms, tomatoes, fetaCheese }

// Protocol defines how to build a pizza
protocol PizzaBuilder {
    var pizzaSize: PizzaSize { get }
    var pizzaToppings: [Toppings] { get }
}

// Default getPizza() shared by all builders
extension PizzaBuilder {
    func getPizza() -> String {
        let kind = String(describing: type(of: self))
        let size = String(describing: pizzaSize)
        let toppings = pizzaToppings.map { String(describing: $0) }.joined(separator: ", ")
        
        return "Kind: \(kind)\nSize: \(size)\nToppings: \(toppings)"
    }
}

// Concrete Chicago pizza builder
struct ChicagoPizza: PizzaBuilder {
    let pizzaSize: PizzaSize
    let pizzaToppings: [Toppings]
    
    init(pizzaSize: PizzaSize = .medium,
         pizzaToppings: [Toppings] = [.mozzarella, .groundBeef, .mushrooms]) {
        self.pizzaSize = pizzaSize
        self.pizzaToppings = pizzaToppings
    }
}

// Concrete New York pizza builder
struct NewYorkPizza: PizzaBuilder {
    let pizzaSize: PizzaSize
    let pizzaToppings: [Toppings]
    
    init(pizzaSize: PizzaSize = .medium,
         pizzaToppings: [Toppings] = [.mozzarella, .pepperoni, .olives]) {
        self.pizzaSize = pizzaSize
        self.pizzaToppings = pizzaToppings
    }
}

// Concrete Greek pizza builder
struct GreekPizza: PizzaBuilder {
    let pizzaSize: PizzaSize
    let pizzaToppings: [Toppings]
    
    init(pizzaSize: PizzaSize = .medium,
         pizzaToppings: [Toppings] = [.fetaCheese, .olives, .tomatoes]) {
        self.pizzaSize = pizzaSize
        self.pizzaToppings = pizzaToppings
    }
}

// Director to build all kinds of pizzas
class Director {
    func buildPizza(_ builder: any PizzaBuilder) -> String { builder.getPizza() }
}

// Demo
let director = Director()

let chicago = director.buildPizza(ChicagoPizza(pizzaSize: .large))
let newYork = director.buildPizza(NewYorkPizza())
let greek = director.buildPizza(GreekPizza(pizzaSize: .small))

print(chicago)
print("\n")
print(newYork)
print("\n")
print(greek)

// Expected output:
// Kind: ChicagoPizza
// Size: large
// Toppings: mozzarella, groundBeef, mushrooms
//
// Kind: NewYorkPizza
// Size: medium
// Toppings: mozzarella, pepperoni, olives
//
// Kind: GreekPizza
// Size: small
// Toppings: fetaCheese, olives, tomatoes
