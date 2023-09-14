import 'package:clock_app/data.dart';
import 'package:clock_app/model/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.redAccent,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarm.gradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors.last.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Office',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool value) {},
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      'Mon-Fri',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '07:00 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ]),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  dashPattern: [5, 4],
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: TextButton(
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 32, vertical: 16),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset('assets/add_alarm.png', scale: 1.5),
                            const SizedBox(height: 8),
                            const Text(
                              'Add Alarm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )),
                ),
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }
}
