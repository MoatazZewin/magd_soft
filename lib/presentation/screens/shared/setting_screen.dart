import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../widget/default_app_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DefaultAppButton(
        height: 8.h,
        width: 65.w,
        fontSize: 20.0,
        onTap: () {
          CacheHelper.clearData();
          Navigator.pushNamed(context, '/login');
        },
        text: 'Logout',
        textColor: Colors.white,
        backGround: Colors.blue,
      )),
    );
  }
}
