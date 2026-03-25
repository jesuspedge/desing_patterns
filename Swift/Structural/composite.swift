//
//  composite.swift
//
//
//

// Protocol with commun operation
protocol Element {
    func getPrice() -> Double
}

// Struct with the concrete implementation of comun
// operation
struct Box: Element {
    let elements: [any Element]

    init(elements: [any Element]) {
        self.elements = elements
    }

    // In this case we get the price for each child
    func getPrice() -> Double { elements.reduce(0) { $0 + $1.getPrice() } }
}

// Struct with the concrete implementation of comun
// operation
struct Product: Element {
    private let _price: Double

    init(price: Double) {
        self._price = price
    }

    // In this case simply return its price
    func getPrice() -> Double { _price }
}

// Demo
let product1 = Product(price: 15)
let product2 = Product(price: 5)
let product3 = Product(price: 5)
let product4 = Product(price: 10)
let product5 = Product(price: 5)

let box1 = Box(elements: [product1, product2])
let box2 = Box(elements: [product3, product4])

let bigBox = Box(elements: [box1, box2, product5])

print("Elements in the box:")
bigBox.elements.forEach { print(type(of: $0)) }
print("Final price: \(bigBox.getPrice())")

// Here is the result:
// Elements in the box:
// Box
// Box
// Product
// Final price: 40.0
