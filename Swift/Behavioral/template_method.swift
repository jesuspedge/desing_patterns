//
//  template_method.swift
//

// Protocol that defines commun
// methods.
protocol DataMiner {
    func openFile()
    func extractData()
    func parseData()
    func analyzeData()
    func sendReport()
    func closeFile()
}

// Extension that defines especific
// methods implementations.
extension DataMiner {
    func mine() {
        openFile()
        extractData()
        parseData()
        analyzeData()
        sendReport()
        closeFile()
    }

    func analyzeData() { print("Data Miner analyzing data...") }
    
    func sendReport() { print("Data Miner sending report...") }
}

// Concrete implementation with
// it owns methods.
struct DOCDataMiner: DataMiner {
    func openFile() { print("Opening DOC file...") }
    
    func extractData() { print("Extracting DOC file data...") }
    
    func parseData() { print("Parsing DOC data...") }
    
    func closeFile() { print("Closing DOC file...") }
}

// Concrete implementation with
// it owns methods.
struct CSVDataMiner: DataMiner {
    func openFile() { print("Opening CSV file...") }
    
    func extractData() { print("Extracting CSV file data...") }
    
    func parseData() { print("Parsing CSV data...") }
    
    func closeFile() { print("Closing CSV file...") }
}

// Concrete implementation with
// it owns methods.
struct PDFDataMiner: DataMiner {
    func openFile() { print("Opening PDF file...") }
    
    func extractData() { print("Extracting PDF file data...") }
    
    func parseData() { print("Parsing PDF data...") }
    
    func closeFile() { print("Closing PDF file...") }
}

// Demo

let docMiner = DOCDataMiner()
let csvMiner = CSVDataMiner()
let pdfMiner = PDFDataMiner()

print("-----Mining DOC File-----")
docMiner.mine()

print("\n-----Mining CSV File-----")
csvMiner.mine()

print("\n-----Mining PDF File-----")
pdfMiner.mine()

// Here is the result:

// -----Mining DOC File-----
// Opening DOC file...
// Extracting DOC file data...
// Parsing DOC data...
// Data Miner analyzing data...
// Data Miner sending report...
// Closing DOC file...

// -----Mining CSV File-----
// Opening CSV file...
// Extracting CSV file data...
// Parsing CSV data...
// Data Miner analyzing data...
// Data Miner sending report...
// Closing CSV file...

// -----Mining PDF File-----
// Opening PDF file...
// Extracting PDF file data...
// Parsing PDF data...
// Data Miner analyzing data...
// Data Miner sending report...
// Closing PDF file...


