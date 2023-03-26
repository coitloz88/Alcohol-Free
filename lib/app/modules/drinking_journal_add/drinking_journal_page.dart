import 'package:flutter/widgets.dart';

class DrinkingJournalPage extends StatelessWidget {
  const DrinkingJournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              //오늘의 기분은 어땠나요?
            ],
          )),
    );
  }
}

class ContainerWithHeading extends StatelessWidget {
  final String title;
  Container container;

  ContainerWithHeading(
      {super.key, required this.title, required this.container});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        container,
      ],
    );
  }
}
