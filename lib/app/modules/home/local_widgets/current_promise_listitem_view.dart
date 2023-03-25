import 'package:flutter/widgets.dart';

class CurrentPromiseListItemContainer extends StatelessWidget {
  final int index;

  const CurrentPromiseListItemContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 152,
      color: Color(0xFFF7F7F7),
      child: CurrentPromiseCardContainer(),
    );
  }
}

class CurrentPromiseCardContainer extends StatelessWidget {
  const CurrentPromiseCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          children: const [
            Text('호중이 혼맥 줄이기'),
            Text('공개'),
            Text(
              '40%',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 44, width: 127, child: Text('global로..')),
          ],
        ));
  }
}
