import 'package:flutter/material.dart';

class JournalHeading extends StatelessWidget {
  const JournalHeading(this.heading, {super.key});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Text(
        heading,
      ),
    );
  }
}