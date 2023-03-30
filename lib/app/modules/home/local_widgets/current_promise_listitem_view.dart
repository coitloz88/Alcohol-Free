import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          children: [
            Text('${promise.name}'),
            Text('${promise.levelOfAccess.name}'),
            Text(
              '${promise.requisite.ratio * 100}%',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
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
                        Text(' ${promise.friends.length}',
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
                          child: Image.network(
                            'https://picsum.photos/seed/342/600',
                            fit: BoxFit.cover,
                          ),
                        ),
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
