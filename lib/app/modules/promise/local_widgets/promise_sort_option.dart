import 'package:flutter/material.dart';

class PromiseSortOptionContainer extends StatelessWidget {
  const PromiseSortOptionContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 40,
      child: Align(
        alignment: AlignmentDirectional(1, 0),
        child: TextButton(
            onPressed: null,
            child: SizedBox(height: 24, width: 80, child: Text('최신순 ▼'))),
      ),
    );
  }
}
