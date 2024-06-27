/// Abstract class that implements commun
/// methods implementation and template method
/// with execution steps.
abstract class DataMiner {
  void mine() {
    openFile();
    extractData();
    parseData();
    analyzeData();
    sendReport();
    closeFile();
  }

  void openFile();

  void extractData();

  void parseData();

  void analyzeData() => print('Data Miner analyzing data...');

  void sendReport() => print('Data Miner sending report...');

  void closeFile();
}

/// Concrete implementation overriding
/// it owns methods.
class DOCDataMiner extends DataMiner {
  @override
  void openFile() => print('Opening DOC file...');

  @override
  void extractData() => print('Extracting DOC file data...');

  @override
  void parseData() => print('Parsing DOC data...');

  @override
  void closeFile() => print('Closing DOC file...');
}

/// Concrete implementation overriding
/// it owns methods.
class CSVDataMiner extends DataMiner {
  @override
  void openFile() => print('Opening CSV file...');

  @override
  void extractData() => print('Extracting CSV file data...');

  @override
  void parseData() => print('Parsing CSV data...');

  @override
  void closeFile() => print('Closing CSV file...');
}

/// Concrete implementation overriding
/// it owns methods.
class PDFDataMiner extends DataMiner {
  @override
  void openFile() => print('Opening PDF file...');

  @override
  void extractData() => print('Extracting PDF file data...');

  @override
  void parseData() => print('Parsing PDF data...');

  @override
  void closeFile() => print('Closing PDF file...');
}

void main() {
  final docMiner = DOCDataMiner();
  final csvMiner = CSVDataMiner();
  final pdfMiner = PDFDataMiner();

  print('-----Mining DOC File-----');
  docMiner.mine();

  print('\n-----Mining CSV File-----');
  csvMiner.mine();

  print('\n-----Mining PDF File-----');
  pdfMiner.mine();

  /// Here is the result:
/*
-----Mining DOC File-----
Opening DOC file...
Extracting DOC file data...
Parsing DOC data...
Data Miner analyzing data...
Data Miner sending report...
Closing DOC file...

-----Mining CSV File-----
Opening CSV file...
Extracting CSV file data...
Parsing CSV data...
Data Miner analyzing data...
Data Miner sending report...
Closing CSV file...

-----Mining PDF File-----
Opening PDF file...
Extracting PDF file data...
Parsing PDF data...
Data Miner analyzing data...
Data Miner sending report...
Closing PDF file...
*/
}
