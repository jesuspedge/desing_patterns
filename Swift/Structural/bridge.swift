//
//  bridge.swift
//
//

// Abstraction of our shape
protocol Shape {
    func getName() -> String
}

// Abstraction for our colors
protocol Color {
    func getColor() -> String
}

// Concrete implmentation of color blue
struct Blue: Color {
    func getColor() -> String { "Blue" }
}

// Concrete implmentation of color red
struct Red: Color {
    func getColor() -> String { "Red" }
}

// Concrete implmentation for a circle
// with the color relation.
struct Circle: Shape {
    let color: Color

    init(color: Color) {
        self.color = color
    }

    func getName() -> String { "Circle" }
}

// Concrete implmentation for a square
// with the color relation.
struct Square: Shape {
    let color: Color

    init(color: Color) {
        self.color = color
    }

    func getName() -> String { "Square" }
}

// Demo
let circle = Circle(color: Red())
let square = Square(color: Blue())

print("This is a \(circle.getName()) with color \(circle.color.getColor()).")
print("This is a \(square.getName()) with color \(square.color.getColor()).")

// Here is the result:
// This is a Circle with color Red.
// This is a Square with color Blue.
