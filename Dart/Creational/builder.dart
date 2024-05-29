/// Enum to define the pizza sizes
enum PizzaSize { small, medium, large }

/// Enum to define all pizza toppings
enum Toppings {
  mozarella,
  groundBeef,
  sausage,
  pepperoni,
  onion,
  mushrooms,
  greenPapers,
  tomatoeSauce,
  tangyTomatoePaste,
  cheddar,
  fetaCheese,
  blackOlives,
  redOnion,
}

/// Interface defines how to build a Pizza
abstract interface class PizzaBuilder {
  PizzaBuilder({
    required PizzaSize pizzaSize,
    required List<Toppings> pizzaToppings,
  })  : _pizzaSize = pizzaSize,
        _pizzaToppings = pizzaToppings;

  final PizzaSize _pizzaSize;
  final List<Toppings> _pizzaToppings;

  /// Returns the pizza after build
  String getPizza() => '''
Kind: ${this.runtimeType}
Size: $_pizzaSize
Toppings: $_pizzaToppings
''';
}

/// Concrete Chicago pizza buider
class ChicagoPizza extends PizzaBuilder {
  ChicagoPizza({required PizzaSize pizzaSize})
      : super(pizzaSize: pizzaSize, pizzaToppings: [
          Toppings.mozarella,
          Toppings.groundBeef,
          Toppings.sausage,
          Toppings.pepperoni,
          Toppings.onion,
          Toppings.mushrooms,
          Toppings.greenPapers,
        ]);
}

/// Concrete New York pizza buider
class NewYorkPizza extends PizzaBuilder {
  NewYorkPizza({required PizzaSize pizzaSize})
      : super(pizzaSize: pizzaSize, pizzaToppings: [
          Toppings.mozarella,
          Toppings.tomatoeSauce,
        ]);
}

/// Concrete Greek pizza buider
class GreekPizza extends PizzaBuilder {
  GreekPizza({required PizzaSize pizzaSize})
      : super(pizzaSize: pizzaSize, pizzaToppings: [
          Toppings.tangyTomatoePaste,
          Toppings.mozarella,
          Toppings.cheddar,
          Toppings.fetaCheese,
          Toppings.blackOlives,
          Toppings.redOnion,
        ]);
}

/// Director to build all kinds of pizzas
class Director {
  String buildPizza(PizzaBuilder builder) => builder.getPizza();
}

void main() {
  final director = Director();

  final pizza1 = director.buildPizza(ChicagoPizza(pizzaSize: PizzaSize.small));
  final pizza2 = director.buildPizza(NewYorkPizza(pizzaSize: PizzaSize.medium));
  final pizza3 = director.buildPizza(GreekPizza(pizzaSize: PizzaSize.large));

  print(pizza1);
  print(pizza2);
  print(pizza3);

  /// Here is the result:
/*
Kind: ChicagoPizza
Size: PizzaSize.small
Toppings: [Toppings.mozarella, Toppings.groundBeef, Toppings.sausage, Toppings.pepperoni, Toppings.onion, Toppings.mushrooms, Toppings.greenPapers]

Kind: NewYorkPizza
Size: PizzaSize.medium
Toppings: [Toppings.mozarella, Toppings.tomatoeSauce]

Kind: GreekPizza
Size: PizzaSize.large
Toppings: [Toppings.tangyTomatoePaste, Toppings.mozarella, Toppings.cheddar, Toppings.fetaCheese, Toppings.blackOlives, Toppings.redOnion]
*/
}
