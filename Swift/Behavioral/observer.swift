//
//  observer.swift
//
//

import Foundation

// Simple struct to hold a message notification
struct Notification {
    let message: String

    init(message: String) {
        self.message = message
    }
}

// Protocol for subscriber types
protocol Subscriber {
    var id: UUID { get }
    func notify(notification: Notification)
}

// Concrete implementation of Subscriber using the user's name
struct NotificationSubscriber: Subscriber, CustomStringConvertible {
    let id: UUID
    let name: String

    init(name: String) {
        self.id = UUID()
        self.name = name
    }

    func notify(notification: Notification) {
        print("\(name), \(notification.message)")
    }
    
    // Custom description String
    var description: String { name }
}

// Class to manage subscribers and notify them
final class Publisher {
    private var subscribers: [any Subscriber] = []

    func registerSubscriber(subscriber: any Subscriber) {
        subscribers.append(subscriber)
        print("\(subscriber) added!")
    }

    func removeSubscriber(subscriber: any Subscriber) {
        subscribers.removeAll { $0.id == subscriber.id }
        print("\(subscriber) removed!")
    }

    func notifySubscribers(notification: Notification) {
        subscribers.forEach { $0.notify(notification: notification) }
    }
}

// Demo

let publisher = Publisher()
let notification = Notification(message: "you have a new notification!")
let user1 = NotificationSubscriber(name: "User1")
let user2 = NotificationSubscriber(name: "User2")
let user3 = NotificationSubscriber(name: "User3")

publisher.registerSubscriber(subscriber: user1)
publisher.registerSubscriber(subscriber: user2)

publisher.notifySubscribers(notification: notification)

publisher.registerSubscriber(subscriber: user3)
publisher.removeSubscriber(subscriber: user1)

publisher.notifySubscribers(notification: notification)

// Here is the result:

// User1 added!
// User2 added!
// User1, you have a new notification!
// User2, you have a new notification!
// User3 added!
// User1 removed!
// User2, you have a new notification!
// User3, you have a new notification!
