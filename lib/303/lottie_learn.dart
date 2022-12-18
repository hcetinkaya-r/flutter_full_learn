import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  _LottieLearnState createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    return Center(
        child: Lottie.network(_loadingLottie));
  }
}


