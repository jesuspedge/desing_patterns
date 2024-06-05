/// Class with commun operation
abstract interface class Element {
  double getPrice();
}

/// Class with the concrete implementation of comun
/// operation
class Box implements Element {
  Box({required this.elements});

  final List<Element> elements;

  /// In this case we get the price for each child
  @override
  double getPrice() => elements.fold(
      0, (previousValue, element) => previousValue + element.getPrice());
}

/// Class with the concrete implementation of comun
/// operation
class Product implements Element {
  Product({required double price}) : _price = price;

  final double _price;

  /// In this case simply return its price.
  @override
  double getPrice() => _price;
}

void main() {
  final product1 = Product(price: 15);
  final product2 = Product(price: 5);
  final product3 = Product(price: 5);
  final product4 = Product(price: 10);
  final product5 = Product(price: 5);

  final box1 = Box(elements: [product1, product2]);
  final box2 = Box(elements: [product3, product4]);

  final bigBox = Box(elements: [box1, box2, product5]);

  print('Elements in the box:');
  bigBox.elements.forEach((element) => print(element.runtimeType));
  print('Final price: ${bigBox.getPrice()}');

  /// Here is the result:
  /*
  Elements in the box:
  Box
  Box
  Product
  Final price: 40.0
  */
}
