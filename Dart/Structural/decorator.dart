/// Base interface
abstract interface class Notifier {
  void sendNotification();
}

/// Concrete implmenetation for SMS notifications
class SmsNotifier implements Notifier {
  @override
  void sendNotification() => print('Sending SMS notification!');
}

/// Concrete implementation for Facebook notifications
class FacebookNotifier implements Notifier {
  @override
  void sendNotification() => print('Sending Facebook notification!');
}

/// Concrete implementation for Slack notifications
class SlackNotifier implements Notifier {
  @override
  void sendNotification() => print('Sending Slack notification!');
}

/// Extension for SMS notifications
class SmsNotifierDecorator extends SmsNotifier {
  SmsNotifierDecorator({required this.notifier});

  final Notifier notifier;

  @override
  void sendNotification() {
    notifier.sendNotification();
    super.sendNotification();
  }
}

/// Extension for Facebook notifications
class FacebookNotifierDecorator extends FacebookNotifier {
  FacebookNotifierDecorator({required this.notifier});

  final Notifier notifier;

  @override
  void sendNotification() {
    notifier.sendNotification();
    super.sendNotification();
  }
}

/// Extension for Slack notifications
class SlackNotifierDecorator extends SlackNotifier {
  SlackNotifierDecorator({required this.notifier});

  final Notifier notifier;

  @override
  void sendNotification() {
    notifier.sendNotification();
    super.sendNotification();
  }
}

void main() {
  final smsNotifier = SmsNotifier();
  final facebookNotifierDecorator =
      FacebookNotifierDecorator(notifier: smsNotifier);
  final slackNotifierDecorator =
      SlackNotifierDecorator(notifier: facebookNotifierDecorator);

  slackNotifierDecorator.sendNotification();

  /// Here is the result:
  /*
  Sending SMS notification!
  Sending Facebook notification!
  Sending Slack notification!
  */
}
