import 'package:alcohol_free/app/data/models/progress_list_item_data.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/progress_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromiseView extends StatelessWidget {
  final List<PromiseProgressItem> entries =
      List.generate(samplePromises.length, (index) => samplePromises[index]);

  PromiseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: ProgressListItemView(entries[index])));
            }));
  }
}
