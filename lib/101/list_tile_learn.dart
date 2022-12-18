import 'package:flutter/material.dart';
import 'package:flutter_101/core/random_img.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final String imgUrl =
        'https://www.oxxo.com.tr/ContentImages/Blog/images/Yasam/apple_logosunun_tarihcesi_1.jpg';

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                // tileColor: Colors.blueGrey,
                dense: true,
                title: const RandomImg(),
                onTap: () {},
                subtitle: const Text('How do u use your card'),
                leading: const Icon(Icons.money),
                trailing: const Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      ),
    );
  }
}
