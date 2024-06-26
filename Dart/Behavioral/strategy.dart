/// Interface to defines the methods of each strategy
abstract interface class Strategy {
  double execute({required double a, required double b});
}

/// Concrete implementation with it owns strategy
class AddStrategy implements Strategy {
  @override
  double execute({required double a, required double b}) => a + b;
}

/// Concrete implementation with it owns strategy
class SubstracStrategy implements Strategy {
  @override
  double execute({required double a, required double b}) => a - b;
}

/// Concrete implementation with it owns strategy
class MultiplyStrategy implements Strategy {
  @override
  double execute({required double a, required double b}) => a * b;
}

/// Executes actions depending on privided strategy
class Context {
  Strategy? _strategy;

  void setStrategy({required Strategy strategy}) => this._strategy = strategy;

  double executeStrategy({required double a, required double b}) =>
      _strategy?.execute(a: a, b: b) ?? 0;
}

void main() {
  final context = Context();

  final addStrategy = AddStrategy();
  final substractStrategy = SubstracStrategy();
  final multiplyStrategy = MultiplyStrategy();

  final a = 4;
  final b = 10;

  print('Number a value: $a  Number b value: $b\n');

  context.setStrategy(strategy: addStrategy);
  print(
      'Add strategy result: ${context.executeStrategy(a: a.toDouble(), b: b.toDouble())}');

  context.setStrategy(strategy: substractStrategy);
  print(
      'Substract strategy result: ${context.executeStrategy(a: a.toDouble(), b: b.toDouble())}');

  context.setStrategy(strategy: multiplyStrategy);
  print(
      'Multiply strategy result: ${context.executeStrategy(a: a.toDouble(), b: b.toDouble())}');

  /// Here is the result:
/*
Number a value: 4  Number b value: 10

Add strategy result: 14.0
Substract strategy result: -6.0
Multiply strategy result: 40.0
*/
}
