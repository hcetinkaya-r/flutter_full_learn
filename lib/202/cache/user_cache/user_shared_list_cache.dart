import 'package:flutter/material.dart';
import 'package:flutter_101/202/cache/shared_learn_cache.dart';
import 'package:flutter_101/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_101/202/cache/user_cache/user_model.dart';

import '../shared_manager.dart';

class UserSharedListCache extends StatefulWidget {
  const UserSharedListCache({Key? key}) : super(key: key);

  @override
  State<UserSharedListCache> createState() => _UserSharedListCacheState();
}

class _UserSharedListCacheState extends LoadingState<UserSharedListCache> {
  late final UserCacheManager userCacheManager;

  List<User> _users =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAndSave();
  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();

    await manager.init();

    userCacheManager = UserCacheManager(manager);

    _users = userCacheManager.getItems() ??[];

    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? const CircularProgressIndicator(color: Colors.white) : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                  onPressed: () async {
                    changeLoading();
                    await userCacheManager.saveItems(_users);
                    changeLoading();
                  },
                  icon: const Icon(Icons.download),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove),
                ),
              ],
      ),
      body: UserListView(users: _users),
    );
  }
}

class UserListView extends StatelessWidget {
  const UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(users[index].name ?? ''),
              subtitle: Text(users[index].description ?? ''),
              trailing: Text(
                users[index].url ?? '',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(decoration: TextDecoration.underline),
              ),
            ),
          );
        });
  }
}
