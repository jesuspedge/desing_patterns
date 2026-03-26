//
//  decorator.swift
//
//
//

// Base protocol
protocol Notifier {
    func sendNotification()
}

// Concrete implementation for SMS notifications
struct SmsNotifier: Notifier {
    func sendNotification() { print("Sending SMS notification!") }
}

// Concrete implementation for Facebook notifications
struct FacebookNotifier: Notifier {
    func sendNotification() { print("Sending Facebook notification!") }
}

// Concrete implementation for Slack notifications
struct SlackNotifier: Notifier {
    func sendNotification() { print("Sending Slack notification!") }
}

// Base decorator class
// Wraps any Notifier and delegates to it
class NotifierDecorator: Notifier {
    private let wrappee: any Notifier

    init(notifier: any Notifier) {
        self.wrappee = notifier
    }

    func sendNotification() {
        wrappee.sendNotification()
    }
}

// Extension for SMS notifications
class SmsNotifierDecorator: NotifierDecorator {
    override func sendNotification() {
        super.sendNotification()
        print("Sending SMS notification!")
    }
}

// Extension for Facebook notifications
class FacebookNotifierDecorator: NotifierDecorator {
    override func sendNotification() {
        super.sendNotification()
        print("Sending Facebook notification!")
    }
}

// Extension for Slack notifications
class SlackNotifierDecorator: NotifierDecorator {
    override func sendNotification() {
        super.sendNotification()
        print("Sending Slack notification!")
    }
}

// Demo
let smsNotifier = SmsNotifier()
let facebookNotifierDecorator = FacebookNotifierDecorator(notifier: smsNotifier)
let slackNotifierDecorator = SlackNotifierDecorator(notifier: facebookNotifierDecorator)

slackNotifierDecorator.sendNotification()

// Here is the result:
// Sending SMS notification!
// Sending Facebook notification!
// Sending Slack notification!
