//
//  prototype.swift
//

// Shape protocol
protocol Shape {
    var color: String { get }
    
    func clone() -> Self
}

// Concrete rectangle prototype
struct Rectangle: Shape {
    let width: Int
    let height: Int
    let color: String

    func clone() -> Rectangle {
        Rectangle(width: width, height: height, color: color)
    }
}

// Concrete circle prototype
struct Circle: Shape {
    let radius: Int
    let color: String

    func clone() -> Circle {
        Circle(radius: radius, color: color)
    }
}

// Main
let rectangle = Rectangle(width: 20, height: 10, color: "Red")
let rectangleClone = rectangle.clone()

let circle = Circle(radius: 15, color: "Blue")
let circleClone = circle.clone()

print("""
--Original Rectangle--
Width: \(rectangle.width)
Height: \(rectangle.height)
Color: \(rectangle.color)
----------------------
---Clone Rectangle---
Width: \(rectangleClone.width)
Height: \(rectangleClone.height)
Color: \(rectangleClone.color)
----------------------

---Original Circle---
Radius: \(circle.radius)
Color: \(circle.color)
----------------------
-----Clone Circle-----
Radius: \(circleClone.radius)
Color: \(circleClone.color)
----------------------
""")

// Expected output:
//
//--Original Rectangle--
//Width: 20
//Height: 10
//Color: Red
//----------------------
//---Clone Rectangle---
//Width: 20
//Height: 10
//Color: Red
//----------------------

//---Original Circle---
//Radius: 15
//Color: Blue
//----------------------
//-----Clone Circle-----
//Radius: 15
//Color: Blue
//----------------------
