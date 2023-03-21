import 'package:flutter/material.dart';

class PromiseSortContainer extends StatelessWidget {
  const PromiseSortContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 24,
      child: Align(
        alignment: AlignmentDirectional(1, 0),
        child: TextButton(
            onPressed: null,
            child: SizedBox(height: 24, width: 100, child: Text('최신순 ▼'))),
      ),
    );
  }
}
