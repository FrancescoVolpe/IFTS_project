class LoginResponse {
  final String email;
  final String access_token;

  LoginResponse({
    required this.email,
    required this.access_token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email: json['email']?.toString() ?? '',
      access_token: json['access_token']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'access_token': access_token,
    };
  }

  @override
  String toString() {
    return 'LoginResponse(email: $email, access_token: $access_token)';
  }
}