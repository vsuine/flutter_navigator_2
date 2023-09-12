import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 一画面で状態が完結する場合は HookWidget を使用する
///
/// use~~ を使うことで StatefulWidget のときに
/// dispose していたような処理は書かなくてよくなる
class SubView02 extends HookWidget {
  const SubView02({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sampleTextEditingController = useTextEditingController(text: "");
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(controller: sampleTextEditingController),
          ],
        ),
      ),
    );
  }
}
