import 'dart:math';

/// Class with the tree shared state
class TreeType {
  TreeType({required this.name, required this.color});

  final String name;
  final String color;
}

/// Class with the tree state
class Tree {
  Tree({required int x, required int y, required this.type})
      : _x = x,
        _y = y;

  final int _x;
  final int _y;
  final TreeType type;

  void draw() => print('${type.color} ${type.name} at ($_x, $_y).');
}

/// Class Factory to builds each tree,
/// Stores the shared state.
class TreeFactory {
  static Map<String, TreeType> treeTypes = {};

  TreeType getTreeType({required String name, required String color}) {
    TreeType? result = treeTypes[name];

    if (result == null) {
      result = TreeType(name: name, color: color);
      treeTypes[name] = result;
    }

    return result;
  }
}

/// Class to create trees and paint all forest
/// calling each tree shred and individual states.
class Forest {
  List<Tree> _trees = [];

  void plantTree(
      {required int x,
      required int y,
      required String name,
      required String color}) {
    TreeType type = TreeFactory().getTreeType(name: name, color: color);

    Tree tree = Tree(x: x, y: y, type: type);

    _trees.add(tree);
  }

  void paint() {
    _trees.forEach((tree) => '$tree.draw()');
  }
}

void main() {
  final random = Random();
  final types = ['Willow', 'Maple', 'Black Berry', 'Magnolia', 'Beech'];
  final colors = ['Green', 'Brown', 'Pink'];
  final forest = Forest();

  for (int i = 0; i <= 30; i++) {
    forest.plantTree(
      x: random.nextInt(50),
      y: random.nextInt(50),
      name: types[random.nextInt(4)],
      color: colors[random.nextInt(2)],
    );
  }

  forest.paint();

  /// Here is the result:
  /*
  Green Black Berry at (24, 23).
  Brown Willow at (31, 45).
  Green Black Berry at (47, 11).
  Green Black Berry at (38, 11).
  Green Black Berry at (22, 30).
  Green Black Berry at (18, 35).
  Brown Willow at (9, 1).
  Brown Maple at (18, 20).
  Green Magnolia at (31, 32).
  Green Magnolia at (24, 1).
  Green Magnolia at (5, 33).
  Green Black Berry at (44, 1).
  Brown Willow at (4, 3).
  Brown Willow at (24, 32).
  Green Black Berry at (2, 46).
  Brown Maple at (40, 4).
  Green Black Berry at (4, 18).
  Green Magnolia at (29, 37).
  Brown Maple at (18, 29).
  Brown Willow at (23, 29).
  Brown Willow at (20, 6).
  Green Magnolia at (19, 43).
  Green Magnolia at (39, 3).
  Brown Maple at (12, 28).
  Brown Willow at (32, 35).
  Brown Willow at (18, 18).
  Brown Willow at (29, 24).
  Brown Willow at (1, 44).
  Brown Willow at (46, 35).
  Green Black Berry at (34, 35).
  Green Magnolia at (5, 43).
  */
}
