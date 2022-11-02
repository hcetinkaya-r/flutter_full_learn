import 'package:flutter/material.dart';

class RandomImg extends StatelessWidget {
  const RandomImg({Key? key, this.height = 100}) : super(key: key);

  final String imgUrl =
      'https://www.oxxo.com.tr/ContentImages/Blog/images/Yasam/apple_logosunun_tarihcesi_1.jpg';

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(imgUrl, height: height, fit: BoxFit.cover);
  }
}
