/// Concrete memento class, it needs a object state
/// to be saved.
class Memento {
  Memento({required String state}) : _state = state;

  String _state;

  String get state => _state;
}

/// Concrete originator class to save states snapshots.
class Originator {
  Originator({required String state}) : _state = state;

  String _state;

  void setState({required String newState}) => _state = newState;

  Memento save() => Memento(state: _state);

  void restore({required Memento memento}) => _state = memento.state;
}

/// Class to save an history of mementos to acces
/// later.
class CareTaker {
  Originator? originator;
  List<Memento> history = [];

  void undo() {
    if (history.isNotEmpty) {
      history.removeLast();
    }
  }

  void saveMemento({required Memento memento}) => history.add(memento);
}

void main() {
  final string = Originator(state: 'Initial state');
  final careTaker = CareTaker();

  careTaker.originator = string;
  careTaker.saveMemento(memento: string.save());

  string.setState(newState: 'Second state');
  careTaker.saveMemento(memento: string.save());

  string.setState(newState: 'Third state');
  careTaker.saveMemento(memento: string.save());

  string.setState(newState: 'Final state');
  careTaker.saveMemento(memento: string.save());

  print('-----Current States-----');
  careTaker.history.forEach((momento) => print(momento.state));

  string.restore(memento: careTaker.history.elementAt(2));
  careTaker.saveMemento(memento: string.save());

  print('\n-----States before restoring-----');
  careTaker.history.forEach((momento) => print(momento.state));

  print('\n-----States before undo-----');
  careTaker
    ..undo()
    ..undo()
    ..undo();
  careTaker.history.forEach((momento) => print(momento.state));

  /// Here is the result:
/*
-----Current States-----
Initial state
Second state
Third state
Final state

-----States before restoring-----
Initial state
Second state
Third state
Final state
Third state

-----States before undo-----
Initial state
Second state
*/
}
