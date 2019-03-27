import 'package:test/test.dart';

main() {
  test('Iterable.generate', () {
    expect(Iterable.generate(5).toList(), equals([0, 1, 2, 3, 4]));
  });
}
