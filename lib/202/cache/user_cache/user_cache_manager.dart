import 'dart:convert';

import 'package:flutter_101/202/cache/shared_manager.dart';
import 'package:flutter_101/202/cache/user_cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(final List<User> items) async {
//Compute ile de yapılabilir, ram açısından json encode ve decode pahalı bir işlem

    final _items = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringList(SharedKeys.users);

    if (itemsString?.isNotEmpty ?? false) {
      return itemsString?.map((element) {
        final jsonObject = jsonDecode(element);

        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }

        return User('', '', '');
      }).toList();
    }

    return null;
  }
}
