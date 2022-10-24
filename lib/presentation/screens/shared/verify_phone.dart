import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_cubit/otp_states.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../business_logic/otp_cubit/otp_cubit.dart';
import '../../../data/data_providers/local/cache_helper.dart';
import '../../widget/default_app_button.dart';

class VerifyPhone extends StatelessWidget {
  String code = '';
  String phone = CacheHelper.getDataFromSharedPreference(key: 'phone');
  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();

    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  bottom: 100.0,
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(
                    'Verify Phone',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              Form(
                key: key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          height: 68,
                          width: 68,
                          child: Center(
                            child: TextFormField(
                              autofocus: true,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  code += value.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'xxx';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                code += value.toString()!;
                              },
                              style: Theme.of(context).textTheme.headline5,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          height: 68,
                          width: 68,
                          child: Center(
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  code += value.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'xxx';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                code += value!;
                              },
                              style: Theme.of(context).textTheme.headline5,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          height: 68,
                          width: 68,
                          child: Center(
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  code += value.toString();
                                  FocusScope.of(context).nextFocus();
                                  print('the total number is $code');
                                }
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'xxx';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                code += value!;
                              },
                              style: Theme.of(context).textTheme.headline5,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(15.0),
                        child: SizedBox(
                          height: 68,
                          width: 68,
                          child: Center(
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  code += value.toString();
                                  print("the last code is $code");
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'xxx';
                                }
                                return null;
                              },
                              style: Theme.of(context).textTheme.headline5,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text('Resend Code'),
              SizedBox(
                height: 10.h,
              ),
              DefaultAppButton(
                height: 7.h,
                width: 75.w,
                fontSize: 20.0,
                onTap: () {
                  OtpCubit.get(context).userOtp(
                      phone: phone,
                      code: code,
                      afterSuccess: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      afterFail: () {});
                },
                text: 'Verify',
                textColor: Colors.white,
                backGround: Colors.blue,
              )
            ],
          ),
        );
      },
    );
  }
}
