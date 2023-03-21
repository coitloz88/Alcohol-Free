import 'package:alcohol_free/app/modules/promise/local_widgets/progress_list_item.dart';
import 'package:flutter/material.dart';

class PromiseStatusView extends StatelessWidget {
  const PromiseStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Text(
              '진행중인 약속',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: const [ProgressListItemView()],
          ),
        ]));
  }
}
