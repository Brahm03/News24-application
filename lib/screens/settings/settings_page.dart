import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/colorConst.dart';

class SettingsPage extends StatefulWidget {
  final List names;
  const SettingsPage({required this.names,Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Icon> _icons = const [
    Icon(CupertinoIcons.profile_circled),
    Icon(CupertinoIcons.person),
    Icon(CupertinoIcons.star),
    Icon(Icons.notifications_none_sharp),
    Icon(CupertinoIcons.moon),
    Icon(CupertinoIcons.question_circle),
    Icon(CupertinoIcons.question_circle),
    Icon(Icons.logout),
  ];
  bool _isDark = false;
  final List<String> _list = [
    'Profile',
    'Account',
    'Interest',
    'Notification',
    'Dark mode',
    'Terms & Conditions',
    'About',
    'Log out'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(16)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: getWidth(310)),
                child: const Text(
                  'Settings',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              )),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: _icons.length,
                  itemBuilder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: getHeight(20)),
                      child: FadeInLeftBig(
                        child: InkWell(
                          onTap: () {
                            __ == 0
                                ? Navigator.pushNamed(context, '/profile',
                                    arguments: [])
                                : () {};
                          },
                          child: ListTile(
                            title: SizedBox(
                              height: getHeight(40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_list[__]),
                                  const Spacer(),
                                  const Divider(
                                    thickness: 1,
                                    color: ColorsConst.black,
                                  )
                                ],
                              ),
                            ),
                            trailing: __ == 4
                                ? Switch(
                                    value: _isDark,
                                    onChanged: (v) {
                                      _isDark = v;
                                      if (_isDark) {
                                        AdaptiveTheme.of(context).setDark();
                                      } else {
                                        AdaptiveTheme.of(context).setLight();
                                      }
                                      setState(() {});
                                    })
                                : const Icon(CupertinoIcons.right_chevron),
                            leading: _icons[__],
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
