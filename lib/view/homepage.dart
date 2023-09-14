import 'package:clock_app/view/clock_view.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/model/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '-';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    print(timeZoneString);

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((e) => buildMenuButton(/*e.title, e.imageSource,*/ e))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType != MenuType.clock) return Container();
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  // alignment: Alignment.center,
                  // color: const Color(0xFF2D2F41),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          'Clock',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                                fontSize: 64,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 4,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Timezone',
                              style: TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(Icons.language, color: Colors.white),
                                const SizedBox(width: 16),
                                Text(
                                  'UTC$offsetSign$timeZoneString',
                                  style: const TextStyle(
                                    fontFamily: 'avenir',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(
      /*String title, String image,*/ MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        // var menuBackgroundColor;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              backgroundColor: currentMenuInfo.menuType == value.menuType
                  ? const Color.fromARGB(195, 2, 3, 34)
                  : Colors.transparent,
            ),
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenuInfo(currentMenuInfo);
            },
            child: Column(
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                const SizedBox(height: 16),
                Text(
                  currentMenuInfo.title,
                  style: const TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const menuBackgroundColor = Color(0xFF2D2F41);
