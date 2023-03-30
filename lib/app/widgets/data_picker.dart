import 'package:flutter/material.dart';

class DataPickerWithHeading extends StatefulWidget {
  final String heading;
  int? dayBuffer;
  DateTime? disableDateTime;

  DataPickerWithHeading(
      {super.key, required this.heading, this.dayBuffer, this.disableDateTime});

  @override
  State<DataPickerWithHeading> createState() => _DataPickerWithHeadingState();
}

class _DataPickerWithHeadingState extends State<DataPickerWithHeading> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(widget.heading,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      const SizedBox(width: 6.0),
      ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
                context: context,
                initialDate: date.add(Duration(days: widget.dayBuffer ?? 0)),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                selectableDayPredicate: (date) {
                  if (widget.disableDateTime != null &&
                      date == widget.disableDateTime) {
                    return false;
                  } else
                    return true;
                });
            if (selectedDate != null) {
              setState(() {
                date = selectedDate;
              });
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xfff3f3f3)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22))),
            splashFactory: NoSplash.splashFactory,
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Center(
              child: Text(
            "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
            style: const TextStyle(color: Colors.black),
          )))
    ]);
  }
}
