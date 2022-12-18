// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_101/202/cache/shared_manager.dart';
import 'package:flutter_101/202/cache/user_cache/user_model.dart';
import 'package:flutter_101/202/cache/user_cache/user_shared_list_cache.dart';

class SharedLearnCache extends StatefulWidget {
  const SharedLearnCache({Key? key}) : super(key: key);

  @override
  _SharedLearnCacheState createState() => _SharedLearnCacheState();
}

class _SharedLearnCacheState extends LoadingState<SharedLearnCache> {
  int _currentValue = 0;

  late final SharedManager _sharedManager;

  late final _users;

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  Future<void> _getDefaultValues() async {
    _onChangeValue(_sharedManager.getString(SharedKeys.key) ?? '');
  }

  Future<void> _initialize() async {
    changeLoading();
    await _sharedManager.init();

    changeLoading();

    _getDefaultValues();
  }

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    _initialize();
    _users = UserItems().users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          _loading
              ? Center(
                  child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(child: UserListView(users: _users))
        ],
      ),
    );
  }

  bool get _loading => isLoading;

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        await _sharedManager.saveString(SharedKeys.key, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();

        await _sharedManager.removeItem(SharedKeys.key);
        changeLoading();
      },
    );
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('vb1', '101', 'bb10.dev'),
      User('vb2', '102', 'bb10.dev'),
      User('vb3', '103', 'bb10.dev'),
    ];
  }
}

//Generic
abstract class LoadingState<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
