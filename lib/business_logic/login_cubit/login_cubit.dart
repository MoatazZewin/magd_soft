import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../data/data_providers/local/cache_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  LoginResponse? loginResponse;

  static LoginCubit get(context) => BlocProvider.of(context);

  Future userLogin({
    required String name,
    required String phone,
    required Function() afterSuccess,
    required Function() afterFail,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postData(url: verifyPhone, body: {
      'phone': phone,
      'name': name,
    }).then((value) {
      loginResponse = LoginResponse.fromJson(value.data);
      if (loginResponse!.status == 200) {
        emit(LoginSuccessState(loginResponse!));
        CacheHelper.saveDataSharedPreference(key: 'name', value: name);
        CacheHelper.saveDataSharedPreference(key: 'phone', value: phone);
        CacheHelper.saveDataSharedPreference(
            key: 'message', value: loginResponse?.message);
        afterSuccess();
        showToast(
          message: 'Login Successful',
          color: ToastState.SUCESS,
        );
      } else {
        emit(LoginSuccessStateWithoutLogin());
        afterFail();
        showToast(
          message: '${loginResponse!.message}',
          color: ToastState.EROERR,
        );
      }
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
