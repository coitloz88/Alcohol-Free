import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressListItemView extends StatefulWidget {
  const ProgressListItemView(this.promise, {Key? key}) : super(key: key);

  final Promise promise;

  @override
  State<ProgressListItemView> createState() => _ProgressListItemViewState();
}

class _ProgressListItemViewState extends State<ProgressListItemView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: const Color(0xFFFFF8EE),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.promise.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    '${widget.promise.from.year.toString()}.${widget.promise.from.month.toString().padLeft(2, '0')}.${widget.promise.from.day.toString().padLeft(2, '0')}~${widget.promise.to.year.toString()}.${widget.promise.to.month.toString().padLeft(2, '0')}.${widget.promise.to.day.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
              height: 4,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runSpacing: 4,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.emoji_events,
                          size: 14,
                          color: Color(0xFFFF6B00),
                        ),
                        Text(
                          ' ${widget.promise.reward}',
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFFFF6B00)),
                        )
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        widget.promise.requisite.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    LinearPercentIndicator(
                      percent: widget.promise.requisite.ratio, //TODO
                      width: 177,
                      lineHeight: 6,
                      animation: false,
                      progressColor: const Color(0xFFFFAC30),
                      backgroundColor: const Color(0xFFF1F4F8),
                      barRadius: const Radius.circular(5.5),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                if (widget.promise.friends != null &&
                    widget.promise.friends?.length != 0)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.handshakeAngle,
                        color: Color(0xFFFFAC30),
                        size: 12,
                      ),
                      Text(' ${widget.promise.friends?.length}',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/empty_profile_circle.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
