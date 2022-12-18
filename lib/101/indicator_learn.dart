import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const[CenterCircularProgress()],
      ),
      body: const Center(
        child: CenterCircularProgress(),
      ),
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 10,
        value: 0.9,
        backgroundColor: Colors.white,
      ),
    );
  }
}
