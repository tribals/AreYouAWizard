import 'dart:math';

class WizardGame {
  var _rounds = 0;
  var _currentGuess;
  var _wins = 0;
  var _looses = 0;
  var _random = Random();

  DateTime pickDate() {
    _rounds++;
    _currentGuess = _randomDateInRange();

    return _currentGuess;
  }

  DateTime _randomDateInRange() {
    var now = DateTime.now();
    var upperBound = _inSeconds(now.millisecondsSinceEpoch);
    var lowerBound = _inSeconds(
        DateTime(now.year - 1, now.month, now.day).millisecondsSinceEpoch);

    return DateTime.fromMillisecondsSinceEpoch(
        _inMillis(_randomIntInRange(lowerBound, upperBound)));
  }

  int _randomIntInRange(lower, upper) {
    return lower + _random.nextInt(upper - lower);
  }

  guess(weekday) {
    if (_playerGuessed(weekday)) {
      _wins++;
    } else {
      _looses++;
    }
  }

  bool _playerGuessed(weekday) {
    return weekday == _currentGuess.weekday;
  }

  bool didIWin() {
    return _wins > _looses;
  }
}

int _inSeconds(int millis) {
  return (millis / 1000).toInt();
}

int _inMillis(int seconds) {
  return seconds * 1000;
}
