import 'package:alcohol_free/app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AFreeDropDownButton extends StatefulWidget {
  final List<String> options;
  final String initialOption;
  final Function controlFunction;

  const AFreeDropDownButton(
      {super.key,
      required this.options,
      required this.initialOption,
      required this.controlFunction});

  @override
  State<AFreeDropDownButton> createState() => _AFreeDropDownButtonState();
}

class _AFreeDropDownButtonState extends State<AFreeDropDownButton> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      isExpanded: true,
      items: widget.options
          .map((option) =>
              DropdownMenuItem<String>(value: option, child: Text(option)))
          .toList(),
      value: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value as String;
          widget.controlFunction(value);
        });
      },
      buttonStyleData: ButtonStyleData(
        height: 44,
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.fromRGBO(243, 243, 243, 1)),
      ),
      iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down_rounded),
          openMenuIcon: Icon(Icons.arrow_drop_up_rounded),
          iconEnabledColor: Color.fromRGBO(63, 63, 63, 1)),
      menuItemStyleData: const MenuItemStyleData(
          height: 40, padding: EdgeInsets.only(left: 12, right: 12)),
    ));
  }
}
