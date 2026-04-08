//
//  memento.swift
//
//
//

// Protocol that defines the save/restore contract for an originator.
protocol Snapshotable {
    func save() -> Memento
    func restore(memento: Memento)
}

// Concrete memento struct, it needs a object state
// to be saved.
struct Memento {
    init(state: String) {
        _state = state
    }

    private let _state: String

    var state: String { _state }
}

/// Concrete originator class to save states snapshots.
class Originator: Snapshotable {
    init(state: String) {
        _state = state
    }

    private var _state: String

    func setState(newState: String) { _state = newState }

    func save() -> Memento { Memento(state: _state) }

    func restore(memento: Memento) { _state = memento.state }
}

// Class to save an history of mementos to access
// later.
class CareTaker {
    var originator: Originator?
    var history: [Memento] = []

    func undo() {
        if !history.isEmpty {
            history.removeLast()
        }
    }

    func saveMemento(memento: Memento) { history.append(memento) }
}

let string = Originator(state: "Initial state")
let careTaker = CareTaker()

careTaker.originator = string
careTaker.saveMemento(memento: string.save())

string.setState(newState: "Second state")
careTaker.saveMemento(memento: string.save())

string.setState(newState: "Third state")
careTaker.saveMemento(memento: string.save())

string.setState(newState: "Final state")
careTaker.saveMemento(memento: string.save())

print("-----Current States-----")
careTaker.history.forEach { print($0.state) }

string.restore(memento: careTaker.history[2])
careTaker.saveMemento(memento: string.save())

print("\n-----States before restoring-----")
careTaker.history.forEach { print($0.state) }

print("\n-----States before undo-----")
careTaker.undo()
careTaker.undo()
careTaker.undo()
careTaker.history.forEach { print($0.state) }

// Here is the result:

// -----Current States-----
// Initial state
// Second state
// Third state
// Final state

// -----States before restoring-----
// Initial state
// Second state
// Third state
// Final state
// Third state

// -----States before undo-----
// Initial state
// Second state
