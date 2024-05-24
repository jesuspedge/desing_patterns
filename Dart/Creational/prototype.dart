/// Base prototype
abstract class Shape {
  /// Comun constructor
  Shape({
    required this.color,
  });

  /// Comun property
  final String color;

  /// Method clone
  Shape.clone(Shape source) : color = source.color;
}

/// Concrete rectangle prototype
class Rectangle extends Shape {
  /// At constructor we acces to parent property
  Rectangle({
    required this.width,
    required this.height,
    required super.color,
  });

  /// Concrete prototype properties
  final int width;
  final int height;

  /// At clone method we retunrn same object accessing
  /// clone method at parent.
  Rectangle.clone(Rectangle super.source)
      : height = source.height,
        width = source.width,
        super.clone();
}

/// Concrete rectangle prototype
class Circle extends Shape {
  /// At constructor we acces to parent property
  Circle({
    required this.radius,
    required super.color,
  });

  /// Concrete prototype property
  final int radius;

  /// At clone method we retunrn same object accessing
  /// clone method at parent.
  Circle.clone(Circle super.source)
      : radius = source.radius,
        super.clone();
}

void main() {
  final rectangle = Rectangle(width: 20, height: 10, color: 'Red');
  final rectangleClone = Rectangle.clone(rectangle);

  final circle = Circle(radius: 15, color: 'Blue');
  final circleClone = Circle.clone(circle);

  print('''
--Original Rectangle--
Width: ${rectangle.width}
Height: ${rectangle.height}
Color: ${rectangle.color}
----------------------
---Clone Rectangle---
Width: ${rectangleClone.width}
Height: ${rectangleClone.height}
Color: ${rectangleClone.color}
----------------------

---Original Circle---
Radius: ${circle.radius}
Color: ${circle.color}
----------------------
-----Clone Circle-----
Radius: ${circle.radius}
Color: ${circleClone.color}
----------------------
''');

  /// Here is the result:
/*
--Original Rectangle--
Width: 20
Height: 10
Color: Red
----------------------
---Clone Rectangle---
Width: 20
Height: 10
Color: Red
----------------------

---Original Circle---
Radius: 15
Color: Blue
----------------------
-----Clone Circle-----
Radius: 15
Color: Blue
----------------------
*/
}
