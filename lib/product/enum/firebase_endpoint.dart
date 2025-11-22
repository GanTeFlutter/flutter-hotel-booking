import 'package:gen/gen.dart';

enum FirebaseEndpoint {
  sendOtp('sendOtp');

  const FirebaseEndpoint(this.path);
  final String path;

  String get url => '${EnvDev.baseUrl}/$path';
}
