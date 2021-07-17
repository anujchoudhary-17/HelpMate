import 'package:flutter/material.dart';

class DahboardView extends StatelessWidget {
  const DahboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext buildContext, int index) {
          return _DashItem();
        });
  }
}

class _DashItem extends StatelessWidget {
  const _DashItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
