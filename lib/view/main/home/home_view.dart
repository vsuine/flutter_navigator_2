import "package:flutter/material.dart";

/// 最も簡単な Widget
/// 基本的に StatelessWidget を使用して画面を描画する
///
/// StatefulWidget で状態を保持するのは複雑
/// かつ再描画範囲が広くなりがちなので使用しない
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SubView01')),
    );
  }
}
