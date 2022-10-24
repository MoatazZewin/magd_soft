import '../../data/network/responses/login_response.dart';
import '../../data/network/responses/otp_response.dart';

abstract class OtpStates {}

class OtpInitialState extends OtpStates{}
class OtpLoadingState extends OtpStates{}
class OtpSuccessState extends OtpStates{
  final OtpResponse otpResponse;

  OtpSuccessState(this.otpResponse);
}
class OtpSuccessStateWithoutOtp extends OtpStates{

}

class OtpErrorState extends OtpStates{
  final String error;
  OtpErrorState(this.error);
}
