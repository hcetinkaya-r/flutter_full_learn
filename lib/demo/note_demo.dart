import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemo extends StatelessWidget {
  NoteDemo({Key? key}) : super(key: key);
  final String _headTitle = 'create your first note';
  final String _subTitle = 'add a note';
  final String _buttonText = 'Create Note';
  final String _textButtonText = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PngImg(name: ImageItems().imageAssetWithoutPath),
            _TitleWidget(title: _headTitle),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(subTitle: _subTitle * 8),
            ),
            const Spacer(),
            ButtonElevated(buttonText: _buttonText),
            TextButton(
              onPressed: () {},
              child: Text(_textButtonText),
            ),
            SizedBox(height: ButtonHeights.buttonNormalHeight),
          ],
        ),
      ),
    );
  }
}

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    Key? key,
    required String buttonText,
  })  : _buttonText = buttonText,
        super(key: key);

  final String _buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: ButtonHeights.buttonNormalHeight,
        child: Text(_buttonText, style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key,
    // ignore: unused_element
    this.textAlign = TextAlign.center,
    required this.subTitle,
  }) : super(key: key);

  final TextAlign textAlign;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add a note ' * 15,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}

class PngImg extends StatelessWidget {
  const PngImg({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset('images/png/$name.png');
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ImageItems {
  final String imageNetwork =
      "https://png.pngtree.com/element_our/png/20181129/vector-illustration-of-fresh-red-apple-with-single-leaf-png_248312.jpg";

  final String imageAssetWithPath = "apple_with_book.png";
  final String imageAssetWithoutPath = "apple_with_book";
}
