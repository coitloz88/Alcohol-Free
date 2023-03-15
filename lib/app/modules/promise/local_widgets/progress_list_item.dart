import 'package:alcohol_free/app/data/models/progress_list_item_data.dart';
import 'package:flutter/material.dart';

class ProgressListItemView extends StatelessWidget {
  final PromiseProgressItem listItem;

  const ProgressListItemView(this.listItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 116,
            width: double.infinity,
            child: Column(
              children: [
                PromiseInfo(
                    listItem.promiseName, listItem.startDate, listItem.endDate),
                ProgressInfo(listItem.progress, listItem.profileImage),
              ],
            )));
  }
}

class PromiseInfo extends StatelessWidget {
  final String promiseName;
  final String startDate;
  final String endDate;

  const PromiseInfo(this.promiseName, this.startDate, this.endDate,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 169, child: Text(promiseName)),
      SizedBox(width: 128, child: Text('$startDate~$endDate'))
    ]);
  }
}

class ProgressInfo extends StatelessWidget {
  final double progress;
  final String profileImage;

  const ProgressInfo(this.progress, this.profileImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return (ListTile(
      trailing: Text(profileImage),
      title: Text('progress: $progress/1.0'),
    ));
  }
}
