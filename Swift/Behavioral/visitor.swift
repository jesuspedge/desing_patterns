//
//  visitor.swift
//
//
//

// Abstract protocol for our shapes
protocol Shape {
    // The classes has his owns methods
    func draw()

    // We only add accept the visitor
    func accept(visitor: any Visitor) -> String
}

// Concrete implementation of circle
struct Circle: Shape {
    private let id: Int
    private let x: Int
    private let y: Int
    private let radius: Int

    init(id: Int, x: Int, y: Int, radius: Int) {
        self.id = id
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    func getId() -> Int { id }
    func getX() -> Int { x }
    func getY() -> Int { y }
    func getRadius() -> Int { radius }

    func draw() { print("draw operation on Circle") }

    func accept(visitor: any Visitor) -> String {
        visitor.visitCircle(circle: self)
    }
}

// Concrete implementation of rectangle
struct Rectangle: Shape {
    private let id: Int
    private let x: Int
    private let y: Int
    private let width: Int
    private let height: Int

    init(id: Int, x: Int, y: Int, width: Int, height: Int) {
        self.id = id
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    func getId() -> Int { id }
    func getX() -> Int { x }
    func getY() -> Int { y }
    func getWidth() -> Int { width }
    func getHeight() -> Int { height }

    func draw() { print("draw operation on Rectangle") }

    func accept(visitor: any Visitor) -> String {
        visitor.visitRectangle(rectangle: self)
    }
}

// Visitor protocol where we define
// all kinds of visitors
protocol Visitor {
    func visitCircle(circle: Circle) -> String
    func visitRectangle(rectangle: Rectangle) -> String
}

// Concrete implementation of our visitor.
// We obtain the data of the object
struct XMLExportVisitor: Visitor {
    func export(shapes: [any Shape]) -> String {
        var string = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"

        shapes.forEach { shape in
            let shapeString = shape.accept(visitor: self)
            string = string + shapeString + "\n"
        }

        return string
    }

    func visitCircle(circle: Circle) -> String {
        return """
<circle>
  <id>\(circle.getId())</id>
  <x>\(circle.getX())</x>
  <y>\(circle.getY())</y>
  <radius>\(circle.getRadius())</radius>
</circle>
"""
    }

    func visitRectangle(rectangle: Rectangle) -> String {
        return """
<rectangle>
  <id>\(rectangle.getId())</id>
  <x>\(rectangle.getX())</x>
  <y>\(rectangle.getY())</y>
  <width>\(rectangle.getWidth())</width>
  <height>\(rectangle.getHeight())</height>
</rectangle>
"""
    }
}

// Demo

let circle = Circle(id: 1, x: 10, y: 5, radius: 5)
let rectangle = Rectangle(id: 2, x: 4, y: 4, width: 6, height: 3)

let xmlVisitor = XMLExportVisitor()

print(xmlVisitor.export(shapes: [circle, rectangle]))

// Here is the result:

// <?xml version="1.0" encoding="utf-8"?>
// <circle>
//   <id>1</id>
//   <x>10</x>
//   <y>5</y>
//   <radius>5</radius>
// </circle>
// <rectangle>
//   <id>2</id>
//   <x>4</x>
//   <y>4</y>
//   <width>6</width>
//   <height>3</height>
// </rectangle>
