import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

import '../../widget/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GlobalCubit.get(context).navigate(afterSuccess: () {
          String? message =
              CacheHelper.getDataFromSharedPreference(key: 'message');
          if (message == null || message == 'Account Created Successfully') {
            CacheHelper.clearData();
            Navigator.of(context).pushNamed('/login');
          } else if (message == 'Account Verified') {
            Navigator.of(context).pushNamed('/home');
          }
        });
        return const Scaffold(
          backgroundColor: Colors.blue,
          body: SplashBody(),
        );
      },
    );
  }
}
