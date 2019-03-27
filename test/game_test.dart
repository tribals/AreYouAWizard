import 'package:test/test.dart';

import 'package:wizard/game.dart';

main() {
  test('Player wins if he guess all the times', () {
    var game = WizardGame();

    for (var _ in Iterable.generate(5)) {
      var date = game.pickDate();

      game.guess(date.weekday);
    }

    expect(game.didIWin(), true);
  });
}
