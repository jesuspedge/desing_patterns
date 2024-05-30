/// Interface to define all methods of the transport
abstract interface class Transport {
  void deliver();
}

/// Concrete truck transport implmentation
class Truck implements Transport {
  @override
  void deliver() => print('Delivery by truck!');
}

/// Concrete ship transport implementation
class Ship implements Transport {
  @override
  void deliver() => print('Delivery by ship!');
}

/// Concrete plane transport implmentation
class Plane implements Transport {
  @override
  void deliver() => print('Delivery by plane!');
}

/// Interface to define all logistics methods
abstract class Logistics {
  Transport createTransport();
}

/// Concrete implementation of road logistics
class RoadLogistics extends Logistics {
  @override
  Transport createTransport() => Truck();
}

/// Concrete implemententation of sea logistics
class SeaLogistics extends Logistics {
  @override
  Transport createTransport() => Ship();
}

/// Concrete implementation of air logistics
class AirLogistics extends Logistics {
  @override
  Transport createTransport() => Plane();
}

void main() {
  final roadLogistics = RoadLogistics();
  final seaLogistics = SeaLogistics();
  final airLogistics = AirLogistics();

  final transport1 = roadLogistics.createTransport();
  final transport2 = seaLogistics.createTransport();
  final transport3 = airLogistics.createTransport();

  transport1.deliver();
  transport2.deliver();
  transport3.deliver();

  /// Here is the result:
/*
Delivery by truck!
Delivery by ship!
Delivery by plane!
*/
}
