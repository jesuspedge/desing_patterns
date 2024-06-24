/// Comun Interface to create mediators
abstract interface class Mediator {
  void notify(Component sender, String event);
}

/// Concrete mediator for dialog
/// It handles all required verifications
class DialogMediator implements Mediator {
  @override
  void notify(Component sender, String event) {
    /// Handle verifications here
    switch (sender.runtimeType) {
      case Button:
        {
          print('${sender.runtimeType} on $event');
        }
      case TextBox:
        {
          print('${sender.runtimeType} on $event');
        }
      case CheckBox:
        {
          print('${sender.runtimeType} on $event');
        }
        ;
    }
  }
}

/// Class to define components and set
/// its meadiator.
abstract class Component {
  Mediator? mediator;

  void setMediator({required Mediator mediator});

  void click();
}

/// Concrete implmentation of button component
class Button extends Component {
  @override
  void setMediator({required Mediator mediator}) => super.mediator = mediator;

  @override
  void click() => super.mediator?.notify(this, 'Button Click');
}

/// Concrete implmentation of textbox component
class TextBox extends Component {
  @override
  void setMediator({required Mediator mediator}) => super.mediator = mediator;

  @override
  void click() => super.mediator?.notify(this, 'TextBox Click');
}

/// Concrete implmentation of checkbox component
class CheckBox extends Component {
  @override
  void setMediator({required Mediator mediator}) => super.mediator = mediator;

  @override
  void click() => super.mediator?.notify(this, 'CheckBox Click');
}

void main() {
  final mediator = DialogMediator();
  final button = Button();
  final textBox = TextBox();
  final checkBox = CheckBox();

  button.setMediator(mediator: mediator);
  textBox.setMediator(mediator: mediator);
  checkBox.setMediator(mediator: mediator);

  button.click();
  textBox.click();
  checkBox.click();

  /// Here is the result:
/*
Button on Button Click
TextBox on TextBox Click
CheckBox on CheckBox Click
*/
}
