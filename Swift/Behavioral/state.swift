//
//  state.swift
//
//

// Protocol to handle all events
protocol PlayerState {
    var player: Player { get }

    func clickLock()
    func clickPlay()
    func clickNext()
    func clickPrevious()
}

// Concrete implementations of events when
// player is locked
struct LockedState: PlayerState {
    let player: Player

    init(player: Player) {
        self.player = player
    }

    func clickLock() {
        if player.playing {
            player.changeState(newState: PlayingState(player: player))
        } else {
            player.changeState(newState: ReadyState(player: player))
        }
    }

    func clickPlay()     { print("Player locked, do anything!") }
    
    func clickNext()     { print("Player locked, do anything!") }
    
    func clickPrevious() { print("Player locked, do anything!") }
}

// Concrete implementations of events when
// player is ready
struct ReadyState: PlayerState {
    let player: Player

    init(player: Player) {
        self.player = player
    }

    func clickLock()     { player.changeState(newState: LockedState(player: player)) }
    
    func clickPlay()     { player.startPlayback(); player.changeState(newState: PlayingState(player: player)) }
    
    func clickNext()     { player.nextSong() }
    
    func clickPrevious() { player.previousSong() }
}

// Concrete implementations of events when
// player is playing
struct PlayingState: PlayerState {
    let player: Player

    init(player: Player) {
        self.player = player
    }

    func clickLock()     { player.changeState(newState: LockedState(player: player)) }
    
    func clickPlay()     { player.stopPlayback(); player.changeState(newState: ReadyState(player: player)) }
    
    func clickNext()     { player.nextSong() }
    
    func clickPrevious() { player.previousSong() }
}

// The player holds the state and delegates all events to it
class Player {
    var state: (any PlayerState)!
    var playing: Bool = false

    func initState() { state = ReadyState(player: self) }

    func changeState(newState: any PlayerState) {
        playing = state is PlayingState
        state = newState
    }

    func clickLock()     { state.clickLock() }
    func clickPlay()     { state.clickPlay() }
    func clickNext()     { state.clickNext() }
    func clickPrevious() { state.clickPrevious() }

    func startPlayback() { print("Starting playback...") }
    func stopPlayback()  { print("Stopping playback...") }
    func nextSong()      { print("Changing to next song...") }
    func previousSong()  { print("Returning to previous...") }
}

// Demo

let player = Player()

player.initState()
player.clickPlay()
player.clickNext()
player.clickPrevious()
player.clickLock()
player.clickPlay()
player.clickNext()
player.clickPrevious()
player.clickLock()
player.clickNext()
player.clickPrevious()
player.clickPlay()

// Here is the result:

// Starting playback...
// Changing to next song...
// Returning to previous...
// Player locked, do anything!
// Player locked, do anything!
// Player locked, do anything!
// Changing to next song...
// Returning to previous...
// Stopping playback...
