import 'package:alcohol_free/app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AFreeDropDownButton extends StatefulWidget {
  final List<String> options;
  final String initialOption;

  const AFreeDropDownButton(
      {super.key, required this.options, required this.initialOption});

  @override
  State<AFreeDropDownButton> createState() => _AFreeDropDownButtonState();
}

class _AFreeDropDownButtonState extends State<AFreeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    String selectedOption = widget.initialOption;

    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      isExpanded: true,
      items: widget.options
          .map((option) =>
              DropdownMenuItem<String>(value: option, child: Text(option)))
          .toList(),
      value: selectedOption,
      onChanged: (value) => print('선택한 drop down menu $value'),
      buttonStyleData: ButtonStyleData(
        height: 44,
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.fromRGBO(243, 243, 243, 1)),
      ),
      iconStyleData: const IconStyleData(
          iconSize: 20,
          icon: Icon(Icons.arrow_drop_down_rounded),
          openMenuIcon: Icon(Icons.arrow_drop_up_rounded),
          iconEnabledColor: Color.fromRGBO(63, 63, 63, 1)),
      menuItemStyleData: const MenuItemStyleData(
          height: 40, padding: EdgeInsets.fromLTRB(24, 8, 24, 8)),
    ));
  }
}
