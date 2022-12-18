import 'package:flutter/material.dart';

import 'package:flutter_101/303/call_back_learn.dart';

class CallbackDropdown extends StatefulWidget {
  const CallbackDropdown({
    Key? key,
    required this.onUserSelected,
  }) : super(key: key);

  final void Function(CallBackUser user) onUserSelected;

  @override
  _CallbackDropdownState createState() => _CallbackDropdownState();
}

class _CallbackDropdownState extends State<CallbackDropdown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });

    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _user,
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name, style: Theme.of(context).textTheme.bodyText2),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
