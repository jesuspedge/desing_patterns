/// Simple class to put a message notification
class Notification {
  Notification({
    required this.message,
  });

  final String message;
}

/// Interface of subscriber class
abstract interface class Subscriber {
  void notify({required Notification notification});
}

/// Concrete implementation of susbscriber.
/// In this case we are using the user name.
class NotificationSubscriber implements Subscriber {
  NotificationSubscriber({required this.name});

  final String name;

  @override
  void notify({required Notification notification}) =>
      print('$name, ${notification.message}');

  @override
  toString() => '$name';
}

/// Class to manage the subscribers and notify them.
class Publisher {
  List<Subscriber> _subscribers = [];

  void registerSubscriber({required Subscriber subscriber}) {
    _subscribers.add(subscriber);
    print('$subscriber added!');
  }

  void removeSubscriber({required Subscriber subscriber}) {
    _subscribers.remove(subscriber);
    print('$subscriber removed!');
  }

  void notifySubscribers({required Notification notification}) => _subscribers
      .forEach((subscriber) => subscriber.notify(notification: notification));
}

void main() {
  final publisher = Publisher();
  final notification = Notification(message: 'you have a new notification!');
  final user1 = NotificationSubscriber(name: 'User1');
  final user2 = NotificationSubscriber(name: 'User2');
  final user3 = NotificationSubscriber(name: 'User3');

  publisher
    ..registerSubscriber(subscriber: user1)
    ..registerSubscriber(subscriber: user2);

  publisher.notifySubscribers(notification: notification);

  publisher
    ..registerSubscriber(subscriber: user3)
    ..removeSubscriber(subscriber: user1);

  publisher.notifySubscribers(notification: notification);

  /// Here is the result:
/*
User1 added!
User2 added!
User1, you have a new notification!
User2, you have a new notification!
User3 added!
User1 removed!
User2, you have a new notification!
User3, you have a new notification!
*/
}
