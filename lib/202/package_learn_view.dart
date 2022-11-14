import 'package:flutter/material.dart';
import 'package:flutter_101/202/package/launch_mixin.dart';
import 'package:flutter_101/202/package/loading_bar.dart';
import 'package:flutter_101/202/theme/light_theme_data.dart';
import 'package:flutter_101/202/widgets/password_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  _PackageLearnViewState createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  bool _isTrue = true;

  _changeLoading() {
    setState(() {
      _isTrue = !_isTrue;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeLoading();
  }

  final Uri _uri = Uri.parse('https://pub.dev/packages/url_launcher');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: Container(
              height: WidgetSizes.normalCardHeight.value(),
              color: Theme.of(context).backgroundColor,
            ),
          ),
          PasswordTextfield(),
          CheckboxListTile(
            value: _isTrue,
            title: Text('Select'),
            onChanged: (value) {
              value = _changeLoading();
            },
          ),
          Expanded(flex: 2, child: LoadingBar(size: 100)),
          Expanded(
            flex: 2,
            child: SpinKitSquareCircle(
              color: Colors.black,
              size: 50,
            ),
          ),
          Expanded(flex: 2, child: Text('HAKAN')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          launchUrl(_uri);
        },
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 25;
    }
  }
}
