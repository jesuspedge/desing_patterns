/// Interface with bussiness logic
/// the implementations do the work
abstract interface class Reciever {}

/// A concrete implementation of reciever
/// implements concretes methods
class Light implements Reciever {
  void turnOn() => print('Light on!');
  void turnOff() => print('Light off!');
}

///Interface with the execute method
abstract interface class Command {
  Command({required this.reciever});

  Reciever reciever;

  void execute();
}

/// Concrete implementation of command
/// Recieves an implmentation of reciever
/// and delegates the operation
class TurnOff extends Command {
  TurnOff({required Light light}) : super(reciever: light);

  @override
  void execute() => (reciever as Light).turnOff();
}

/// Concrete implementation of command
/// Recieves an implmentation of reciever
/// and delegates the operation
class TurnOn extends Command {
  TurnOn({required Light light}) : super(reciever: light);

  @override
  void execute() => (reciever as Light).turnOn();
}

/// Inits and delegate the operations
/// to commands.
/// For this case we save a logs history
class Invoker {
  List<String> _history = [];

  void execute({required Command command}) {
    command.execute();
    _history.add('Executed ${command.runtimeType}');
  }

  String getHistory() =>
      _history.fold('', (previusLog, log) => previusLog + '$log\n');
}

void main() {
  final light = Light();
  final invoker = Invoker();

  invoker.execute(command: TurnOn(light: light));
  invoker.execute(command: TurnOff(light: light));
  invoker.execute(command: TurnOn(light: light));

  print('\nLogs:');
  print(invoker.getHistory());

  /// Here is the result:
/*
Light on!
Light off!
Light on!

Logs:
Executed TurnOn
Executed TurnOff
Executed TurnOn
*/
}
