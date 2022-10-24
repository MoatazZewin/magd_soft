import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_states.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/account_model.dart';
import '../../../data/models/account_model.dart';
import '../../../data/models/account_model.dart';
import '../../../data/network/responses/login_response.dart';
import '../../widget/default_app_button.dart';
import '../../widget/default_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  AccountModel? accountModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, states) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: 105.h,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Image.asset(
                        'assets/images/town.png',
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 72.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 300.0,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 2,
                                    width: 30.w,
                                    color: Colors.blue,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Text('OR'),
                                  ),
                                  Container(
                                    height: 2,
                                    width: 30.w,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 70.0,
                              ),
                              child: Row(
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    elevation: 5.0,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      child: Image.asset(
                                        'assets/images/f.png',
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30.0),
                                      elevation: 5.0,
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        child: Image.asset(
                                          'assets/images/ios.png',
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    elevation: 5.0,
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      child: Image.asset(
                                        'assets/images/google.png',
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 130,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 5.5,
                          child: SizedBox(
                            height: 45.h,
                            width: 85.w,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Welcome',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 70.0,
                                  ),
                                  height: 2,
                                  width: 30.w,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 65.w,
                                  child: Material(
                                    elevation: 10.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                        top: 10,
                                        start: 15.0,
                                      ),
                                      child: Center(
                                        child: DefaultTextField(
                                          controller: name,
                                          hintText: 'Enter Your Full Name',
                                          textInputType: TextInputType.name,
                                          validatorMethod: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'please enter the name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  width: 65.w,
                                  child: Material(
                                    elevation: 10.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                        top: 10,
                                        start: 15.0,
                                      ),
                                      child: Center(
                                        child: DefaultTextField(
                                          controller: phone,
                                          hintText: 'Enter Your phone',
                                          textInputType: TextInputType.phone,
                                          validatorMethod: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'please enter the phone';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                state is LoginLoadingState
                                    ? const CircularProgressIndicator()
                                    : DefaultAppButton(
                                        height: 8.h,
                                        width: 65.w,
                                        fontSize: 20.0,
                                        onTap: () {
                                          LoginCubit.get(context).userLogin(
                                              name: name.text,
                                              phone: phone.text,
                                              afterSuccess: () {
                                                String m = CacheHelper
                                                    .getDataFromSharedPreference(
                                                        key: 'message');
                                                if (m ==
                                                    'Account Created Successfully') {
                                                  Navigator.pushNamed(
                                                      context, '/verify');
                                                } else {
                                                  Navigator.pushNamed(
                                                      context, '/home');
                                                }
                                              },
                                              afterFail: () {
                                                // Navigator.pop(context);
                                              });
                                        },
                                        text: 'Login',
                                        textColor: Colors.white,
                                        backGround: Colors.blue,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
