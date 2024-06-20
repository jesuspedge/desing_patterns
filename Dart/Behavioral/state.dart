/// Interface to handle all events
abstract interface class PlayerState {
  PlayerState({required this.player});

  final Player player;

  void clickLock();
  void clickPlay();
  void clickNext();
  void clickPrevius();
}

/// Concrete implementations of events when
/// player is locked
class LockedState extends PlayerState {
  LockedState({required super.player});

  @override
  void clickLock() {
    if (player.playing) {
      player.changeState(newState: PlayingState(player: player));
    } else {
      player.changeState(newState: ReadyState(player: player));
    }
  }

  @override
  void clickPlay() => print('Player locked, do anything!');

  @override
  void clickNext() => print('Player locked, do anything!');

  @override
  void clickPrevius() => print('Player locked, do anything!');
}

/// Concrete implementations of events when
/// player is ready
class ReadyState extends PlayerState {
  ReadyState({required super.player});

  @override
  void clickLock() => player.changeState(newState: LockedState(player: player));

  @override
  void clickPlay() {
    player.startPlayback();
    player.changeState(newState: PlayingState(player: player));
  }

  @override
  void clickNext() => player.nextSong();

  @override
  void clickPrevius() => player.previusSong();
}

/// Concrete implementations of events when
/// player is playin
class PlayingState extends PlayerState {
  PlayingState({required super.player});

  @override
  void clickLock() => player.changeState(newState: LockedState(player: player));

  @override
  void clickPlay() {
    player.stopPlayback();
    player.changeState(newState: ReadyState(player: player));
  }

  @override
  void clickNext() => player.nextSong();

  @override
  void clickPrevius() => player.previusSong();
}

/// The playes gets the state and implements all events
/// and state changes.
class Player {
  late PlayerState state;

  bool playing = false;

  void initState() => state = ReadyState(player: this);

  void changeState({required PlayerState newState}) {
    playing = state is PlayingState ? true : false;

    state = newState;
  }

  void clickLock() => state.clickLock();

  void clickPlay() => state.clickPlay();

  void clickNext() => state.clickNext();

  void clickPrevius() => state.clickPrevius();

  void startPlayback() => print('Starting playback...');

  void stopPlayback() => print('Stoping playback...');

  void nextSong() => print('Changing to next song...');

  void previusSong() => print('Returning to previus...');
}

void main() {
  final player = Player();

  player
    ..initState()
    ..clickPlay()
    ..clickNext()
    ..clickPrevius()
    ..clickLock()
    ..clickPlay()
    ..clickNext()
    ..clickPrevius()
    ..clickLock()
    ..clickNext()
    ..clickPrevius()
    ..clickPlay();

  /// Here is the result:
/*
Starting playback...
Changing to next song...
Returning to previus...
Player locked, do anything!
Player locked, do anything!
Player locked, do anything!
Changing to next song...
Returning to previus...
Stoping playback...
*/
}
