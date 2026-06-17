class LoginPost {
  final String email;
  final String password;

  LoginPost({
    required this.email,
    required this.password,
  });

  factory LoginPost.fromJson(Map<String, dynamic> json) {
    return LoginPost(
      email: json['email']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'LoginPost(email: $email, password: $password)';
  }
}