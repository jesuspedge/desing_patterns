/// Abstraction of our shape
abstract interface class Shape {
  String getName();
}

/// Abstraction for our colors
abstract interface class Color {
  String getColor();
}

/// Concrete implmentation of color blue
class Blue implements Color {
  @override
  String getColor() => 'Blue';
}

/// Concrete implmentation of color red
class Red implements Color {
  @override
  String getColor() => 'Red';
}

/// Concrete implmentation for a circle
/// with the color relation.
class Circle implements Shape {
  Circle({required this.color});

  final Color color;

  @override
  String getName() => 'Circle';
}

/// Concrete implmentation for a square
/// with the color relation.
class Square implements Shape {
  Square({required this.color});

  final Color color;

  @override
  String getName() => 'Square';
}

void main() {
  final circle = Circle(color: Red());
  final square = Square(color: Blue());

  print('This is a ${circle.getName()} with color ${circle.color.getColor()}.');
  print('This is a ${square.getName()} with color ${square.color.getColor()}.');

  /// Here is the result:
  /*
  This is a Circle with color Red.
  This is a Square with color Blue.
  */
}
