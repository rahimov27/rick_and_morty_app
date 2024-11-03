import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/shared/resources/resources.dart';

void main() {
  test('pngs assets test', () {
    expect(File(Pngs.episodNotFound).existsSync(), isTrue);
    expect(File(Pngs.locationNotFound).existsSync(), isTrue);
    expect(File(Pngs.nativeSplash).existsSync(), isTrue);
    expect(File(Pngs.notFound).existsSync(), isTrue);
    expect(File(Pngs.splash).existsSync(), isTrue);
  });
}
