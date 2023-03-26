import 'package:alcohol_free/app/modules/calendar/local_widgets/add_button.dart';
import 'package:flutter/widgets.dart';

class AddButtonWrapper extends StatelessWidget {
  const AddButtonWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        child: SizedBox(
            height: 175,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Flexible(flex: 1, fit: FlexFit.loose, child: AddButton()),
                Flexible(flex: 1, fit: FlexFit.loose, child: AddButton())
              ],
            )));
  }
}
