/// Interface with the commun methods
abstract interface class LoginHandler {
  void setNext({required LoginHandler handler});
  bool handle({required String email, required String password});
}

/// Concrete implenatation for a validation.
/// Email validation in this case.
class ValidEmailHandler implements LoginHandler {
  LoginHandler? _nextHandler;

  @override
  void setNext({required LoginHandler handler}) => _nextHandler = handler;

  @override
  bool handle({required String email, required String password}) {
    final isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!isValid) return false;

    return _nextHandler?.handle(email: email, password: password) ?? true;
  }
}

/// Concrete implenatation for a validation.
/// Min password length validation in this case.
class ValidMinPasswordLengthHandler implements LoginHandler {
  LoginHandler? _nextHandler;

  @override
  void setNext({required LoginHandler handler}) => _nextHandler = handler;

  @override
  bool handle({required String email, required String password}) {
    final isValid = password.length >= 6;

    if (!isValid) return false;

    return _nextHandler?.handle(email: email, password: password) ?? true;
  }
}

/// Concrete implenatation for a validation.
/// Max password length validation in this case.
class ValidMaxPasswordLengthHandler implements LoginHandler {
  LoginHandler? _nextHandler;

  @override
  void setNext({required LoginHandler handler}) => _nextHandler = handler;

  @override
  bool handle({required String email, required String password}) {
    final isValid = password.length <= 20;

    if (!isValid) return false;

    return _nextHandler?.handle(email: email, password: password) ?? true;
  }
}

void main() {
  /// Creating validators handlers
  final validEmail = ValidEmailHandler();
  final validMinPassword = ValidMinPasswordLengthHandler();
  final validMaxPassWord = ValidMaxPasswordLengthHandler();

  /// Creating the chain
  validEmail.setNext(handler: validMinPassword);
  validMinPassword.setNext(handler: validMaxPassWord);

  final valid1 =
      validEmail.handle(email: 'test@test.com', password: '26552SDF');
  final valid2 = validEmail.handle(email: 'testtest.com', password: '26552SDF');
  final valid3 = validEmail.handle(email: 'test@test.com', password: '26F');
  final valid4 = validEmail.handle(
      email: 'test@test.com',
      password: '26552SDFDSAJFG876DS8F687DS6F8D6FD876F8S768768F');

  print('Validation1: $valid1');
  print('Validation2: $valid2');
  print('Validation3: $valid3');
  print('Validation4: $valid4');

  /// Here is the result:
/*
Validation1: true
Validation2: false
Validation3: false
Validation4: false
*/
}
