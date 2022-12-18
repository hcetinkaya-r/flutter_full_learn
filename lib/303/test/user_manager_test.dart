import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';

import '../generic_learn.dart';

void main() {
  setUp(() {});
  test('User Calculate', () {
    final users = [
      GenericUser('hakan', '11', 10),
      GenericUser('hakan', '11', 10),
      GenericUser('hakan', '11', 20),
    ];

    final userManagement = UserManagement(AdminUser('vadmin', '1', 15, 1));
    final result = userManagement.calculateMoney(users);

    final response = userManagement.showNames<String>(users);

    expect(result, 55);
  });
}
