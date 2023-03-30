import 'package:alcohol_free/app/data/enums/level_of_access.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CurrentPromiseListItemContainer extends StatelessWidget {
  final Promise promise;
  const CurrentPromiseListItemContainer({super.key, required this.promise});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 152,
      color: Color(0xFFF7F7F7),
      child: CurrentPromiseCardContainer(promise),
    );
  }
}

class CurrentPromiseCardContainer extends StatelessWidget {
  const CurrentPromiseCardContainer(this.promise, {super.key});
  final Promise promise;

  @override
  Widget build(BuildContext context) {
    var ratioFormat = NumberFormat('###%', "en_US");
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          children: [
            Text('${promise.name}'),
            promise.levelOfAccess.name == LevelOfAccess.public
                ? const Icon(Icons.lock_open, size: 16)
                : const Icon(Icons.lock, size: 16),
            Text(
              ratioFormat.format(promise.requisite.ratio),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            LinearPercentIndicator(
              percent: promise.requisite.ratio,
              width: 126,
              lineHeight: 6,
              animation: false,
              progressColor: const Color(0xFFFFAC30),
              backgroundColor: const Color(0xFFF1F4F8),
              barRadius: const Radius.circular(5.5),
              padding: EdgeInsets.zero,
            ),
            SizedBox(
              height: 44,
              width: 127,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.handshakeAngle,
                          color: Color(0xFFFFAC30),
                          size: 12,
                        ),
                        Text(
                            ' ${promise.friends != null ? promise.friends?.length : 0}',
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
                  ]),
            ),
          ],
        ));
  }
}
