import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../product/constants/duration_items.dart';
import '../product/constants/lottie_items.dart';
import '../product/global/theme_notifier.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  _LottieLearnState createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              controller.animateTo(!isLight ? 0.5 : 1);

              // context.read<ThemeNotifier>().changeTheme();
              isLight = !isLight;
               Future.microtask(() => context.read<ThemeNotifier>().changeTheme());
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePAth,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
        title: const Text('Title'),
      ),
      body: LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadingLottie = 'https://assets1.lottiefiles.com/packages/lf20_p8bfn5to.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
