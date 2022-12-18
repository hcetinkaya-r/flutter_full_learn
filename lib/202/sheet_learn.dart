import 'dart:developer';

import 'package:flutter/material.dart';

import '../101/list_view_learn.dart';
import 'form_learn_view.dart';
import 'image_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  _SheetLearnState createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton(
        onPressed: () {
          showCustomSheet(context, FormLearnView());
        },
        child: const Text('SHOW'),
      )),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              // backgroundColor: Colors.amber,
              // barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const _CustomSheet();
              });
          inspect(result);

          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  // ignore: unused_field
  Color _backgroundColor = Colors.white;
  final _gripHeight = 30.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PaddingManager.paddingLowTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _gripHeight,
              child: Stack(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 3,
                    indent: MediaQuery.of(context).size.width * 0.45,
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                    right: 10,
                    height: 10,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close)),
                  ),
                ],
              ),
            ),
            const Text('DATA'),
            Image.network('https://picsum.photos/id/237/200/300'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = Colors.amber;
                });
                Navigator.of(context).pop<bool>(true);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        // backgroundColor: Colors.amber,
        // barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        // isScrollControlled: true,
        context: context,
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PaddingManager.paddingLowTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _BaseSheetHeader(), Expanded(child: child)],
        ),
      ),
    );
    ;
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
  })  : _gripHeight = 30.0,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.grey,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

class PaddingManager {
  static const paddingLowTop = EdgeInsets.only(top: 10);
}
