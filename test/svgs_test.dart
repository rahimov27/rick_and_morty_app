import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.search).existsSync(), isTrue);
    expect(File(Svgs.actions).existsSync(), isTrue);
    expect(File(Svgs.episode).existsSync(), isTrue);
    expect(File(Svgs.grid).existsSync(), isTrue);
    expect(File(Svgs.list).existsSync(), isTrue);
    expect(File(Svgs.location).existsSync(), isTrue);
    expect(File(Svgs.settings).existsSync(), isTrue);
    expect(File(Svgs.theme).existsSync(), isTrue);
  });
}
