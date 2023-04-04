import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataPickerWithHeading extends StatefulWidget {
  final String heading;
  int dayBuffer = 0;
  DateTime? disableDateTime;

  DataPickerWithHeading(
      {super.key,
      required this.heading,
      required this.dayBuffer,
      this.disableDateTime});

  @override
  State<DataPickerWithHeading> createState() => _DataPickerWithHeadingState();
}

class _DataPickerWithHeadingState extends State<DataPickerWithHeading> {
  @override
  Widget build(BuildContext context) {
    DateTime date = widget.dayBuffer == 0
        ? Get.find<NewPromisePageController>().from
        : Get.find<NewPromisePageController>().timeTo;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(widget.heading,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      const SizedBox(width: 6.0),
      ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
                context: context,
                initialDate:
                    DateTime.now().add(Duration(days: widget.dayBuffer)),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                selectableDayPredicate: (date) {
                  if (widget.disableDateTime != null &&
                      date == widget.disableDateTime) {
                    return false;
                  } else {
                    return true;
                  }
                });
            if (selectedDate != null) {
              widget.dayBuffer == 0
                  ? Get.find<NewPromisePageController>()
                      .updateFrom(selectedDate)
                  : Get.find<NewPromisePageController>().updateTo(selectedDate);
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
