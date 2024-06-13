/// Abstract class for our shapes
abstract interface class Shape {
  /// The classes has his owns methods
  void draw();

  /// We only add acept the visitor
  String accept({required Visitor visitor});
}

/// Concrete implementation of circle
class Circle extends Shape {
  Circle({
    required int id,
    required int x,
    required int y,
    required int radius,
  })  : _id = id,
        _x = x,
        _y = y,
        _radius = radius;

  final int _id;
  final int _x;
  final int _y;
  final int _radius;

  int get id => _id;
  int get x => _x;
  int get y => _y;
  int get radius => _radius;

  @override
  void draw() => print('draw operation on ${this.runtimeType}');

  @override
  String accept({required Visitor visitor}) =>
      visitor.visitCircle(circle: this);
}

/// Concrete implementation of rectangle
class Rectangle extends Shape {
  Rectangle({
    required int id,
    required int x,
    required int y,
    required int width,
    required int height,
  })  : _id = id,
        _x = x,
        _y = y,
        _width = width,
        _height = height;

  final int _id;
  final int _x;
  final int _y;
  final int _width;
  final int _height;

  int get id => _id;
  int get x => _x;
  int get y => _y;
  int get width => _width;
  int get height => _height;

  @override
  void draw() => print('draw operation on ${this.runtimeType}');

  @override
  String accept({required Visitor visitor}) =>
      visitor.visitRectangle(rectangle: this);
}

/// Class visitor where we define
/// al kinds of visitors
abstract interface class Visitor {
  String visitCircle({required Circle circle});

  String visitRectangle({required Rectangle rectangle});
}

/// Concrete implementation of our visitor.
/// We obtain the data of the object
class XMLExportVisitor implements Visitor {
  String export({required List<Shape> shapes}) {
    String string = '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n';

    shapes.forEach((shape) {
      final shapeString = shape.accept(visitor: this);

      string = string + shapeString + '\n';
    });

    return string;
  }

  @override
  String visitCircle({required Circle circle}) {
    return '''
<circle>
  <id>${circle.id}</id>
  <x>${circle.x}</x>
  <y>${circle.y}</y>
  <radius>${circle.radius}</radius>
</circle>''';
  }

  @override
  String visitRectangle({required Rectangle rectangle}) {
    return '''
<rectangle>
  <id>${rectangle.id}</id>
  <x>${rectangle.x}</x>
  <y>${rectangle.y}</y>
  <width>${rectangle.width}</width>
  <height>${rectangle.height}</height>
</rectangle>''';
  }
}

void main() {
  final circle = Circle(id: 1, x: 10, y: 5, radius: 5);
  final rectangle = Rectangle(id: 2, x: 4, y: 4, width: 6, height: 3);

  final xmlVisitor = XMLExportVisitor();

  print(xmlVisitor.export(shapes: [circle, rectangle]));

  /// Here is the result:
  /*
<?xml version="1.0" encoding="utf-8"?>
<circle>
  <id>1</id>
  <x>10</x>
  <y>5</y>
  <radius>5</radius>
</circle>
<rectangle>
  <id>2</id>
  <x>4</x>
  <y>4</y>
  <width>6</width>
  <height>3</height>
</rectangle>
  */
}
