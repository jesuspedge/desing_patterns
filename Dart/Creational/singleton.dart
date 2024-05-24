/// This is the base clase
/// for this example we are using a
/// database.
class DataBase {
  /// We declarate the instance as private
  static final DataBase _instance = DataBase._internal();

  ///  We always access to the internal instance in the
  /// constructor.
  DataBase._internal();

  /// Allow us to return always the internal instance
  factory DataBase() => _instance;

  /// For this example we add fake data to database,
  /// also we defines getters and setters to acces the
  /// data.
  static String _data = 'This is the database original data!';
  String get data => _data;
  void setdata(String newData) => _data = newData;
}

void main() {
  final dataBase1 = DataBase();
  final dataBase2 = DataBase();

  print(dataBase1.data);

  dataBase2.setdata('This is the new database data!');

  print(dataBase1.data);

  /// Here is the result:
  /*
  This is the database original data!
  This is the new database data!
  */
}
