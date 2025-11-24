class OtpParams {
  const OtpParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.tempUserId,
    this.isSignUp = false,
  });
  final String fullName;
  final String email;
  final String password;
  final String tempUserId;
  final bool? isSignUp;
}
