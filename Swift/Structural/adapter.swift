//
//  adapter.swift
//
//
//

import Foundation

// Class that only accepts round pegs to fit.
// Return true if the peg radius is less than this radius.
struct RoundHole {
    let radius: Double

    func fits(peg: RoundPeg) -> Bool {
        return radius >= peg.radius
    }
}

// Round peg class with its radius.
class RoundPeg {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }
}

// Square peg struct with its width.
struct SquarePeg {
    let width: Double
}

// Class to adapt width to radius and fits to a rounded hole.
class SquarePegAdapter: RoundPeg {
    init(peg: SquarePeg) {
        super.init(radius: (peg.width * sqrt(2)) / 2)
    }
}

// Demo
let hole = RoundHole(radius: 10)
let roundPeg = RoundPeg(radius: 5)

print("Hole Radius: \(hole.radius)")
print("Round Peg Radius: \(roundPeg.radius)")
print("Round Peg fits on Round Hole: \(hole.fits(peg: roundPeg))")

let squarePeg = SquarePeg(width: 12)

// Different types, this is an error:
// print("Round Peg fits on Round Hole: \(hole.fits(peg: squarePeg))")

let squarePegAdapter = SquarePegAdapter(peg: squarePeg)
print("=======================")
print("Hole Radius: \(hole.radius)")
print("Square Peg Width: \(squarePeg.width)")
print("Square Peg Adapter Radius: \(squarePegAdapter.radius)")
print("Square Peg Adapter fits on Round Hole: \(hole.fits(peg: squarePegAdapter))")

// Here is the result:
// Hole Radius: 10.0
// Round Peg Radius: 5.0
// Round Peg fits on Round Hole: true
// =======================
// Hole Radius: 10.0
// Square Peg Width: 12.0
// Square Peg Adapter Radius: 8.485281374238571
// Square Peg Adapter fits on Round Hole: true
