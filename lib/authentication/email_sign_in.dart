import 'package:email_auth/email_auth.dart' ;
EmailAuth emailAuth=EmailAuth(sessionName: 'Email');
Future<bool> sendOtp(String email) async {
  bool result = await emailAuth.sendOtp(
      recipientMail: email, otpLength: 5);
  return result;
}
bool otpVerify(String email,String otp) {
 bool result=emailAuth.validateOtp(recipientMail: email, userOtp: otp);
 return result;
}