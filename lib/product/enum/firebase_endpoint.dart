import 'package:gen/gen.dart';

enum FirebaseEndpoint {
  sendOtp,
  verifyOtp;

  String get url {
    switch (this) {
      case FirebaseEndpoint.sendOtp:
        return EnvDev.sendOtpUrl;
      case FirebaseEndpoint.verifyOtp:
        return EnvDev.verifyOtpUrl;
    }
  }
}
