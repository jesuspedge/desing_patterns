//
//  iterator.swift
//
//

// Protocol to define Iterator operations
protocol Iterator {
    associatedtype Element
    
    mutating func getNext() -> Element
    
    func hasMore() -> Bool
}

// Concrete number iterator implementation
struct NumberIterator: Iterator {
    private var index = 0

    let numbersCollection: [Int]

    init(numbersCollection: [Int]) {
        self.numbersCollection = numbersCollection
    }

    // Apply here concrete iteration rules
    mutating func getNext() -> Int {
        let value = numbersCollection[index]
        
        index += 1

        return value
    }

    func hasMore() -> Bool { index < numbersCollection.count }
}

// Concrete words iterator implementation
struct WordsIterator: Iterator {
    private var index = 0

    let wordsCollection: [String]

    init(wordsCollection: [String]) {
        self.wordsCollection = wordsCollection
    }

    // Apply here concrete iteration rules
    mutating func getNext() -> String {
        let value = wordsCollection[index]
        
        index += 1
        
        return value
    }

    func hasMore() -> Bool { index < wordsCollection.count }
}

// Protocol to define a collection.
// Each collection defines an iterator.
protocol IterableCollection {
    associatedtype IteratorType: Iterator
    func createIterator() -> IteratorType
}

// Concrete implementation of numbers collection
struct NumbersCollection: IterableCollection {
    let numbersCollection: [Int]

    init(numbersCollection: [Int]) {
        self.numbersCollection = numbersCollection
    }

    // Returns number iterator
    func createIterator() -> NumberIterator {
        NumberIterator(numbersCollection: numbersCollection)
    }
}

// Concrete implementation of words collection
struct WordsCollection: IterableCollection {
    let wordsCollection: [String]

    init(wordsCollection: [String]) {
        self.wordsCollection = wordsCollection
    }

    // Returns word iterator
    func createIterator() -> WordsIterator {
        WordsIterator(wordsCollection: wordsCollection)
    }
}

// Demo

let numbersCollection = NumbersCollection(numbersCollection: [1, 2, 3, 4, 5, 6, 7])
var numberIterator = numbersCollection.createIterator()

let wordsCollection = WordsCollection(
    wordsCollection: ["one", "two", "three", "four", "five", "six", "seven"])
var wordsIterator = wordsCollection.createIterator()

print("-----Numbers Collection-----")
while numberIterator.hasMore() {
    print(numberIterator.getNext())
}

print("-----Words Collection-----")
while wordsIterator.hasMore() {
    print(wordsIterator.getNext())
}

// Here is the result:

// -----Numbers Collection-----
// 1
// 2
// 3
// 4
// 5
// 6
// 7
// -----Words Collection-----
// one
// two
// three
// four
// five
// six
// seven
