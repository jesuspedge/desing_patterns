//
//  singleton.swift
//
//


// This is the base clase
// for this example we are using a database.
class DataBase {
    // Static field controls the access to singleton instance
    static let shared = DataBase()
    
    // Initializer as private to prevent direct construction
    // calls
    private init() {}

    // For this example we add fake data to database.
    public var data: String = "This is the database original data!"
}


let dataBase1 = DataBase.shared
let dataBase2 = DataBase.shared

print(dataBase1.data)

dataBase2.data = "This is the new database data!"

print(dataBase1.data)


// Here is the result:
// This is the database original data!
// This is the new database data!
