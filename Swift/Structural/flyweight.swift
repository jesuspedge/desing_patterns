//
//  flyweight.swift
//
//

// Struct with the tree shared state
struct TreeType {
    let name: String
    let color: String
}

// Struct with the tree state
struct Tree {
    private let x: Int
    private let y: Int
    let type: TreeType

    init(x: Int, y: Int, type: TreeType) {
        self.x = x
        self.y = y
        self.type = type
    }

    func draw() {
        print("\(type.color) \(type.name) at (\(x), \(y)).")
    }
}

// Class Factory to builds each tree,
// Stores the shared state.
final class TreeFactory {
    static var treeTypes: [String: TreeType] = [:]

    func getTreeType(name: String, color: String) -> TreeType {
        if let result = TreeFactory.treeTypes[name] {
            return result
        }
        
        let result = TreeType(name: name, color: color)
        TreeFactory.treeTypes[name] = result
        
        return result
    }
}

// Class to create trees and paint all forest
// calling each tree shared and individual states.
final class Forest {
    private var trees: [Tree] = []

    func plantTree(x: Int, y: Int, name: String, color: String) {
        let type = TreeFactory().getTreeType(name: name, color: color)
        
        let tree = Tree(x: x, y: y, type: type)
        
        trees.append(tree)
    }

    func paint() {
        trees.forEach { $0.draw() }
    }
}


// Demo

let types = ["Willow", "Maple", "Black Berry", "Magnolia", "Beech"]
let colors = ["Green", "Brown", "Pink"]
let forest = Forest()

for _ in 0...30 {
    forest.plantTree(
        x: Int.random(in: 0..<50),
        y: Int.random(in: 0..<50),
        name: types[Int.random(in: 0..<5)],
        color: colors[Int.random(in: 0..<3)]
    )
}

forest.paint()

// Here is the result:

// Green Black Berry at (24, 23).
// Brown Willow at (31, 45).
// Green Black Berry at (47, 11).
// Green Black Berry at (38, 11).
// Green Black Berry at (22, 30).
// Green Black Berry at (18, 35).
// Brown Willow at (9, 1).
// Brown Maple at (18, 20).
// Green Magnolia at (31, 32).
// Green Magnolia at (24, 1).
// Green Magnolia at (5, 33).
// Green Black Berry at (44, 1).
// Brown Willow at (4, 3).
// Brown Willow at (24, 32).
// Green Black Berry at (2, 46).
// Brown Maple at (40, 4).
// Green Black Berry at (4, 18).
// Green Magnolia at (29, 37).
// Brown Maple at (18, 29).
// Brown Willow at (23, 29).
// Brown Willow at (20, 6).
// Green Magnolia at (19, 43).
// Green Magnolia at (39, 3).
// Brown Maple at (12, 28).
// Brown Willow at (32, 35).
// Brown Willow at (18, 18).
// Brown Willow at (29, 24).
// Brown Willow at (1, 44).
// Brown Willow at (46, 35).
// Green Black Berry at (34, 35).
// Green Magnolia at (5, 43).
