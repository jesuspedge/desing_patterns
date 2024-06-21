///Abstract class to define Iterator operations
abstract interface class Iterator {
  getNext<T>();
  bool hasMore();
}

/// Concrete number iterator implementation
class NumberIterator implements Iterator {
  int _index = 0;

  final List<int> numbersCollection;

  NumberIterator({required this.numbersCollection});

  /// Apply here concrete iteration rules
  @override
  getNext<T>() => numbersCollection[_index++];

  @override
  bool hasMore() => _index < numbersCollection.length;
}

/// Concrete number iterator implementation
class WordsIterator implements Iterator {
  int _index = 0;

  final List<String> wordsCollection;

  WordsIterator({required this.wordsCollection});

  /// Apply here concrete iteration rules
  @override
  getNext<T>() => wordsCollection[_index++];

  @override
  bool hasMore() => _index < wordsCollection.length;
}

/// Interface to define a collection.
/// Each collection defines an iterator.
abstract interface class IterableCollection {
  Iterator createIterator();
}

/// Concrete implementation of numbers collection
class NumbersCollection implements IterableCollection {
  NumbersCollection({required this.numbersCollection});

  final List<int> numbersCollection;

  /// Returns number iterator
  @override
  Iterator createIterator() =>
      NumberIterator(numbersCollection: numbersCollection);
}

/// Concrete implementation of words collection
class WordsCollection implements IterableCollection {
  WordsCollection({required this.wordsCollection});

  final List<String> wordsCollection;

  /// Returns word iterator
  @override
  Iterator createIterator() => WordsIterator(wordsCollection: wordsCollection);
}

void main() {
  final numbersCollection =
      NumbersCollection(numbersCollection: [1, 2, 3, 4, 5, 6, 7]);
  final numberIterator = numbersCollection.createIterator();

  final wordsCollection = WordsCollection(
      wordsCollection: ['one', 'two', 'three', 'four', 'five', 'six', 'seven']);
  final wordsIterator = wordsCollection.createIterator();

  print('-----Numbers Collection-----');
  while (numberIterator.hasMore()) {
    print(numberIterator.getNext());
  }

  print('-----Words Collection-----');
  while (wordsIterator.hasMore()) {
    print(wordsIterator.getNext());
  }

  /// Here is the result:
/*
-----Numbers Collection-----
1
2
3
4
5
6
7
-----Words Collection-----
one
two
three
four
five
six
seven
*/
}
