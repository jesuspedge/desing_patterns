import 'dart:math';

/// Class that only accepts round pegs to fit.
/// Return true if the peg radius is less than this radius.
class RoundHole {
  RoundHole({required double radius}) : _radius = radius;

  final double _radius;

  double get radius => _radius;

  bool fits({required RoundPeg peg}) => _radius >= peg.radius;
}

/// Round peg class with its radius.
class RoundPeg {
  RoundPeg({required double radius}) : _radius = radius;

  final double _radius;

  double get radius => _radius;
}

/// Square peg class with its width.
class SquarePeg {
  SquarePeg({required double width}) : _width = width;

  final double _width;

  double get width => _width;
}

/// Class to adapt width to radius and fits to
/// a rounded hole.
class SquarePegAdapter extends RoundPeg {
  SquarePegAdapter({required SquarePeg peg})
      : super(radius: (peg.width * sqrt(2)) / 2);
}

void main() {
  final hole = RoundHole(radius: 10);
  final roundPeg = RoundPeg(radius: 5);

  print('Hole Radius: ${hole.radius}');
  print('Round Peg Radius: ${roundPeg.radius}');
  print('Round Peg fits on Round Hole: ${hole.fits(peg: roundPeg)}');

  final squarePeg = SquarePeg(width: 12);

  // Diferent types, this is an error.
  // print('Round Peg fits on Round Hole: ${hole.fits(peg: squarePeg)}');

  final squarePegAdapter = SquarePegAdapter(peg: squarePeg);
  print('=======================');
  print('Hole Radius: ${hole.radius}');
  print('Square Peg Width: ${squarePeg.width}');
  print('Square Peg Adapter Radius: ${squarePegAdapter.radius}');
  print(
      'Square Peg Adapter fits on Round Hole: ${hole.fits(peg: squarePegAdapter)}');

  /// Here is the result:
  /*
  Hole Radius: 10.0
  Round Peg Radius: 5.0
  Round Peg fits on Round Hole: true
  =======================
  Hole Radius: 10.0
  Square Peg Width: 12.0
  Square Peg Adapter Radius: 8.485281374238571
  Square Peg Adapter fits on Round Hole: true
  */
}
