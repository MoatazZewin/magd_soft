import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';


import '../../data/network/responses/otp_response.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());
  OtpResponse? otpResponse;

  static OtpCubit get(context) => BlocProvider.of(context);

  Future userOtp({
    required String code,
    required String phone,
    required Function() afterSuccess,
    required Function() afterFail,
  }) async {
    emit(OtpLoadingState());
    await DioHelper.postData(url: otp, body: {
      'code': code,
      'phone':phone,
    }).then((value) {
      print("${value.data}");
      otpResponse = OtpResponse.fromJson(value.data);
      if (otpResponse!.status == 200) {
        emit(OtpSuccessState(otpResponse!));
        CacheHelper.saveDataSharedPreference(key: 'id', value: otpResponse?.model?.id);
        afterSuccess();
        showToast(
          message: 'the phone is verified',
          color: ToastState.SUCESS,
        );
      } else {
        emit(OtpSuccessStateWithoutOtp());
        afterFail();
        showToast(
          message: '${otpResponse!.message}',
          color: ToastState.EROERR,
        );
      }
    }).catchError((error) {
      print('error inside otp ${error.toString()}');
      emit(OtpErrorState(error.toString()));
    });
  }
}
