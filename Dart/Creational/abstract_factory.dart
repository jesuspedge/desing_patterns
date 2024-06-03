/// Interface to define the chair methods
abstract interface class Chair {
  bool hasLegs();
  void sitOn();
}

/// Interface to define the coffe table methods
abstract interface class CoffeTable {
  bool hasLegs();
  void putOn();
}

/// Concrete implementation of chair for victorian
/// type
class VictorianChair implements Chair {
  @override
  bool hasLegs() => true;

  @override
  void sitOn() => print('Sitting on ${this.runtimeType}');
}

/// Concrete implementation of chair for modern
/// type
class ModernChair implements Chair {
  @override
  bool hasLegs() => false;

  @override
  void sitOn() => print('Sitting on ${this.runtimeType}');
}

/// Concrete implementation of coffe table for
/// victorian type
class VictorianCoffeTable implements CoffeTable {
  @override
  bool hasLegs() => true;

  @override
  void putOn() => print('Putting on ${this.runtimeType}');
}

/// Concrete implementation for coffe table for
/// modern type
class ModernCoffeTable implements CoffeTable {
  @override
  bool hasLegs() => false;

  @override
  void putOn() => print('Putting on ${this.runtimeType}');
}

/// Interface to define all factory methods
/// it doesnt matter what kin of table or chair
/// is returned cause we are using interfaces
abstract interface class FornitureFactory {
  Chair createChair();
  CoffeTable createCoffeTable();
}

/// Concrete implmentation of victorian factory
class VictorianFornitureFactory implements FornitureFactory {
  @override
  Chair createChair() => VictorianChair();

  @override
  CoffeTable createCoffeTable() => VictorianCoffeTable();
}

/// Concrete implementation of modern factory
class ModernFornitureFactory implements FornitureFactory {
  @override
  Chair createChair() => ModernChair();

  @override
  CoffeTable createCoffeTable() => ModernCoffeTable();
}

void main() {
  final victorianFornitureFactory = VictorianFornitureFactory();
  final modernFornitureFactory = ModernFornitureFactory();

  final chair1 = victorianFornitureFactory.createChair();
  final coffeTable1 = victorianFornitureFactory.createCoffeTable();

  final chair2 = modernFornitureFactory.createChair();
  final coffeTable2 = modernFornitureFactory.createCoffeTable();

  print('====Victorian Factory result====');
  print('Chair has legs: ${chair1.hasLegs()}');
  chair1.sitOn();
  print('Table has legs: ${coffeTable1.hasLegs()}');
  coffeTable1.putOn();

  print('====Modern Factory result====');
  print('Chair has legs: ${chair2.hasLegs()}');
  chair2.sitOn();
  print('Table has legs: ${coffeTable2.hasLegs()}');
  coffeTable2.putOn();

  /// Here is the result:
/*
====Victorian Factory result====
Chair has legs: true
Sitting on VictorianChair
Table has legs: true
Putting on VictorianCoffeTable
====Modern Factory result====
Chair has legs: false
Sitting on ModernChair
Table has legs: false
Putting on ModernCoffeTable
*/
}
