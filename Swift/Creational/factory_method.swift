//
//  factory_method.swift
//
//

// Protocol to define all methods of the transport
protocol Transport {
    func deliver()
}

// Concrete truck transport implmentation
class Truck: Transport {
    func deliver() {
        print("Delivery by truck!")
    }
}

// Concrete ship transport implmentation
class Ship: Transport {
    func deliver() {
        print("Delivery by ship!")
    }
}

// Concrete plane transport implmentation
class Plane: Transport {
    func deliver() {
        print("Delivery by plane!")
    }
}

// Interface to define create trasnport method
protocol Logistics {
    func createTransport() -> Transport
}

// Concrete implementation of road logistics
class RoadLogistics: Logistics {
    func createTransport() -> Transport { Truck() }
}

// Concrete implementation of sea logistics
class SeaLogistics: Logistics {
    func createTransport() -> Transport { Ship() }
}

// Concrete implementation of air logistics
class AirLogistics: Logistics {
    func createTransport() -> Transport { Plane() }
}

// Demo
let road = RoadLogistics()
let sea = SeaLogistics()
let air = AirLogistics()

let transport1 = road.createTransport()
let transport2 = sea.createTransport()
let transport3 = air.createTransport()

transport1.deliver()
transport2.deliver()
transport3.deliver()

// Expected output:
// Delivery by truck!
// Delivery by ship!
// Delivery by plane!
