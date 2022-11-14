import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
    final double? size;
  const LoadingBar({
    Key? key,
    required this.size,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.red,
      size: size ?? 50.0,
    );
  }
}
